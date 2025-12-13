local gpg = require("user.utils.gpg")

local OLLAMA_EXT_ENV = os.getenv("OLLAMA_EXT")

local isOllamaServerRunning = function(ollamaHost)
    local cmd = "curl -s -o /dev/null -w \"%{http_code}\n\" -m 0.1 -I " .. ollamaHost .. ":11434"
    return string.match(vim.fn.system(cmd), "200")
end

local available_models = {
    { name = "ministral-3:8b-instruct-2512-q8_0", think = false, stream = true,  ctx = 4096 * 2, temperature = 0.25 },
    { name = "ministral-3:8b",                    think = true,  stream = true,  ctx = 4096 * 8, temperatura = 0.75 },
    { name = "embeddinggemma",                    think = false, stream = false, ctx = 4096 * 1, temperature = 0.50, disable_tools = true },
}

-- default localhost Ollama
local conf = {
    chat = available_models[1],
    instruct = available_models[1],
    rag = available_models[2],
    embed = available_models[3]
}

-- use external local server if it's up and running.
if (isOllamaServerRunning(OLLAMA_EXT_ENV)) then
    local available_models_remote = {
        { name = "ministral-3:3b-instruct-2512-q8_0", host = OLLAMA_EXT_ENV, think = false, stream = true,  temperature = 0.25, ctx = 4096 * 1 },
        { name = "ministral-3:8b",                    host = OLLAMA_EXT_ENV, think = true,  stream = true,  temperatura = 0.75, ctx = 4096 * 2 },
        { name = "embeddinggemma",                    host = OLLAMA_EXT_ENV, think = false, stream = false, temperature = 0.50, ctx = 4096 * 1, disable_tools = true },
    }
    conf = {
        chat = available_models_remote[1],
        instruct = available_models_remote[1],
        rag = available_models_remote[2],
        embed = available_models_remote[3]
    }
end

local register_model_as_provider = function(model)
    return {
        __inherited_from = "ollama",
        disable_tools = model.disable_tools or false,
        timeout = model.timeout or 30000,
        endpoint = model.host or "http://0.0.0.0:11434",
        model = model.name,
        think = model.think or false,
        extra_request_body = {
            temperature = model.temperature or 0.55,
            max_completion_tokens = model.ctx or 4096,
            max_prompt_tokens = model.ctx or 4096,
            max_tokens = model.ctx or 4096,
            stream = model.stream or true,
            think = model.think or false
        },
    }
end

local function get_providers()
    return {
        -- local models
        chat = register_model_as_provider(conf.chat),
        instruct = register_model_as_provider(conf.instruct),
        rag = register_model_as_provider(conf.rag),
        embed = register_model_as_provider(conf.embed),

        -- platforms/3rd party
        gemini = {
            parse_api_key = gpg.decrypt_gemini_key,
            model = "gemini-2.0-flash",
            timeout = 300000, -- 5 minutes timeout for long tasks
            extra_request_body = {
                temperature = 0.7,
                stream = true
            },
        },
        openai = {
            model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
            parse_api_key = gpg.decrypt_openai_key,
            endpoint = "https://api.openai.com/v1",
            timeout = 30000,
            extra_request_body = {
                temperature = 0.8,
                max_completion_tokens = 16384,
                stream = true
            },
        },
        claude = {
            endoint = "https://api.anthropic.com",
            model = "claude-sonnet-4-20250514",
            parse_api_key = gpg.decrypt_claude_key,
            timeout = 30000, -- Timeout in milliseconds
            extra_request_body = {
                temperature = 0.75,
                max_tokens = 20480,
            },
        }
    }
end

local function get_rag_service_conf()
    return {                            -- RAG Service configuration
        enabled = false,                -- Enables the RAG service
        host_mount = os.getenv("HOME"), -- Host mount path for the rag service (Docker will mount this path)
        runner = "docker",              -- Runner for the RAG service (can use docker or nix)
        llm = {                         -- Language Model (LLM) configuration for RAG service
            provider = "rag",
            extra = nil,
        },
        embed = { -- Embedding model configuration for RAG service
            provider = "embed",
            extra = {
                embed_batch_size = 10
            },
        },
        docker_extra_args = "", -- Extra arguments to pass to the docker command
    }
end

return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
        debug = false,
        override_prompt_dir = vim.fn.expand("~/.config/nvim/avante_prompts"),
        provider = "chat",
        providers = get_providers(),
        rag_service = get_rag_service_conf(),
        web_search_engine = {
            provider = 'tavily',
        },
        hints = { enabled = true },
        behaviour = {
            enable_fastapply = false,
            auto_suggestions = false, -- Experimental stage
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = false,
            minimize_diff = true,         -- Whether to remove unchanged lines when applying a code block
            enable_token_counting = true, -- Whether to enable token counting. Default to true.
        },
        windows = {
            ---@type "right" | "left" | "top" | "bottom"
            position = "right",   -- the position of the sidebar
            wrap = true,          -- similar to vim.o.wrap
            width = 35,           -- default % based on available width
            sidebar_header = {
                enabled = true,   -- true, false to enable/disable the header
                align = "center", -- left, center, right for title
                rounded = true,
            },
            input = {
                prefix = "> ",
                height = 8,          -- Height of the input window in vertical layout
                provider = "snacks", -- "native" | "dressing" | "snacks"
                provider_opts = {
                    -- Snacks input configuration
                    title = "Avante Input",
                    icon = " ",
                },
            },
            edit = {
                border = "rounded",
                start_insert = true, -- Start insert mode when opening the edit window
            },
            ask = {
                floating = false,     -- Open the 'AvanteAsk' prompt in a floating window
                start_insert = false, -- Start insert mode when opening the ask window
                border = "rounded",
                ---@type "ours" | "theirs"
                focus_on_apply = "ours", -- which diff to focus after applying
            },
        },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "echasnovski/mini.pick",         -- for file_selector provider mini.pick
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
        "ibhagwan/fzf-lua",              -- for file_selector provider fzf
        "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua",        -- for providers='copilot'
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
