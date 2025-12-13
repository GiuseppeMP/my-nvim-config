local available_models = {
    { name = "ministral-3:8b-instruct-2512-q8_0", think = false, stream = true,  ctx = 4096 * 2, temperature = 0.25 },
    { name = "ministral-3:8b",                    think = true,  stream = true,  ctx = 4096 * 8, temperatura = 0.75 },
    { name = "embeddinggemma",                    think = false, stream = false, ctx = 4096 * 1, temperature = 0.50, disable_tools = true },
}

local register_adapter = function(model)
    return function()
        return require("codecompanion.adapters").extend("ollama", {
            schema = {
                model = {
                    default = model.name,
                },
                num_ctx = {
                    default = model.ctx
                },
                num_predict = {
                    default = -1,
                },
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
        strategies = {
            chat = { adapter = "chat" },
            inline = { adapter = "instruct" },
            agent = { adapter = "instruct" },
        },
        memory = {
            opts = {
                chat = {
                    enabled = true,
                },
            },
        },
        adapters = {
            instruct = register_adapter(available_models[1]),
            chat = register_adapter(available_models[2]),
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
}
