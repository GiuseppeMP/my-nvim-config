return
{
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
        local home = os.getenv "HOME"
        require("chatgpt").setup(
            {
                api_key_cmd = "gpg --decrypt " .. home .. "/.config/secrets/open_ai_key.txt.gpg",
                -- api_host_cmd = "echo -n 'api.openai.com'",
                -- model = "code-davinci-edit-001", -- legacy
                -- model = "gpt-4", $0.03 / 1K tokens
                -- model = "gpt-3.5-turbo", $0.0015 / 1K tokens
                -- model = "gpt-3.5-turbo-instruct",
                openai_params = {
                    -- model = "gpt-3.5-turbo",
                    frequency_penalty = 0,
                    presence_penalty = 0,
                    max_tokens = 600,
                    temperature = 0,
                    top_p = 1,
                    n = 1,
                },
                openai_edit_params = {
                    -- model = "gpt-3.5-turbo-instruct",
                    max_tokens = 600,
                    temperature = 0.1,
                    top_p = 1,
                    n = 1,
                },
            }
        )
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    }
}
