local gpg = require("user.utils.gpg")


local isOllamaRunning = function(ollamaHost)
    local cmd = "curl -s -o /dev/null -w \"%{http_code}\n\" -m 0.1 -I " .. ollamaHost .. ":11434"
    return string.match(vim.fn.system(cmd), "200")
end

local conf = {
    provider = "local_llm_2",
    code_cmp = "local_llm_2",
    rag_llm = "local_llm_2",
    rag_embed = "local_embed_1"
}

if (isOllamaRunning(os.getenv("OLLAMA_EXT"))) then
    conf = {
        provider = "ext_llm_2",
        -- provider = "local_llm_2",
        code_cmp = "local_cmp_1",
        rag_llm = "ext_llm_2",
        rag_embed = "local_embed_1"
    }
end

local localhost = function(model)
    return {
        __inherited_from = "ollama",
        disable_tools = false,
        timeout = 15000,
        endpoint = "http://0.0.0.0:11434",
        model = model,
        think = false,
        extra_request_body = {
            temperature = 0.85,
            max_completion_tokens = 8192 * 1,
            max_prompt_tokens = 8192 * 15,
            stream = true,
            think = false
        },
    }
end

local ext = function(model)
    local ollamaExtHost = os.getenv("OLLAMA_EXT")
    return {
        __inherited_from = "ollama",
        disable_tools = false,
        timeout = nil,
        endpoint = ollamaExtHost .. ":11434",
        model = model,
        extra_request_body = {
            temperature = 0.85,
            max_completion_tokens = 8192 * 1,
            max_prompt_tokens = 8192 * 4,
            stream = true,
            think = false
        },
    }
end


local function get_providers()
    return {
        -- hosted llms (chatp, edit, apply)
        ext_llm_1 = ext("llama3.1:8b"),
        ext_llm_2 = ext("hf.co/unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF"),
        ext_llm_3 = ext("hf.co/bartowski/Llama-3.2-3B-Instruct-GGUF:Q8_0"),
        ext_llm_4 = ext("llama3.2"),
        ext_llm_5 = ext("lukaspetrik/gemma3-tools:12b"),
        ext_llm_6 = ext("gemma3:12b"),
        ext_llm_7 = ext("qwen3:32b"),
        -- embed and code cmp
        ext_embed_1 = ext("nomic-embed-text:latest"),
        ext_cmp_1 = ext("qwen2.5-coder:7b"),

        -- localhost llms
        local_llm_1 = localhost("llama3.1:8b"),
        local_llm_2 = localhost("qwen3-coder:30b-a3b-q4_K_M"),
        local_llm_3 = localhost("hf.co/bartowski/Llama-3.2-3B-Instruct-GGUF:Q8_0"),
        local_llm_4 = localhost("gpt-oss:20b"),
        -- embed and code cmp
        local_cmp_1 = localhost("qwen2.5-coder:3b"),
        local_embed_1 = localhost("nomic-embed-text:latest"),


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
            provider = conf.rag_llm,
            extra = nil,
        },
        embed = { -- Embedding model configuration for RAG service
            provider = conf.rag_embed,
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
        debug = true,
        override_prompt_dir = vim.fn.expand("~/.config/nvim/avante_prompts"),
        provider = conf.provider,
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
            minimize_diff = false,        -- Whether to remove unchanged lines when applying a code block
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
