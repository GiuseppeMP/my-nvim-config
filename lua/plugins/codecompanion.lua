local available_models = {
    { name = "ministral-3:3b-instruct-2512-q8_0", think = false, stream = true,  ctx = 4096 * 2, temperature = 0.25 },
    { name = "ministral-3:8b",                    think = true,  stream = true,  ctx = 4096 * 8, temperatura = 0.75 },
    { name = "embeddinggemma",                    think = false, stream = false, ctx = 4096 * 1, temperature = 0.50, disable_tools = true },
}

local register_adapter = function(model)
    return function()
        return require("codecompanion.adapters").extend("ollama", {
            opts = {
                vision = model.vision or false,
                stream = model.stream or true,
            },
            schema = {
                model = {
                    default = model.name,
                },
                num_ctx = {
                    default = model.ctx or 4096,
                },
                think = {
                    default = model.think or false,
                },
                num_predict = {
                    default = -1,
                },
                keep_alive = {
                    default = model.keep_alive or "1m"
                }
            },
            env = {
                url = "http://localhost:11434",
            },
            headers = {
                ["Content-Type"] = "application/json",
            },
            parameters = {
                sync = true,
            },
        })
    end
end

return {
    "olimorris/codecompanion.nvim",
    opts = {
        extensions = {
            spinner = {},
        },
        display = {
            chat = {
                icons = {
                    chat_context = " ", -- You can also apply an icon to the fold
                },
                auto_scroll = true,
                fold_context = true,
                opts = {
                    completion_provider = "blink", -- blink|cmp|coc|default
                },
                fold_reasoning = true,
                show_reasoning = true,
            },
            action_palette = {
                width = 95,
                height = 10,
                prompt = "Prompt ",                     -- Prompt used for interactive LLM calls
                provider = "telescope",                 -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
                opts = {
                    show_default_actions = true,        -- Show the default actions in the action palette?
                    show_default_prompt_library = true, -- Show the default prompt library in the action palette?
                    title = "CodeCompanion actions",    -- The title of the action palette
                },
            },
        },
        strategies = {
            chat = { adapter = "chat" },
            agent = { adapter = "instruct" },
            inline = {
                adapter = "instruct",
                keymaps = {
                    stop = {
                        modes = { n = "q" },
                        index = 4,
                        callback = "keymaps.stop",
                        description = "Stop request",
                    },
                    accept_change = {
                        modes = { n = "ga" },
                        description = "Accept the suggested change",
                    },
                    reject_change = {
                        modes = { n = "gr" },
                        opts = { nowait = true },
                        description = "Reject the suggested change",
                    },
                },
            },
        },
        memory = {
            opts = {
                chat = {
                    enabled = false,
                },
            },
        },
        adapters = {
            http = {
                instruct = register_adapter(available_models[1]),
                chat = register_adapter(available_models[2]),
            }
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        'franco-ruggeri/codecompanion-spinner.nvim',
        "nvim-treesitter/nvim-treesitter",
    },
}
