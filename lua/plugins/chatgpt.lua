return
{
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
        local home = os.getenv "HOME"
        local actions_paths = { '~/.config/nvim/lua/plugins/chatgpt-actions.json' }
        vim.inspect(actions_paths)
        require("chatgpt").setup(
            {
                actions_paths = actions_paths,
                chat = {
                    welcome_message = WELCOME_MESSAGE,
                    loading_text = "Loading, please wait ...",
                    question_sign = "", -- 🙂
                    answer_sign = "ﮧ", -- 🤖
                    border_left_sign = "",
                    border_right_sign = "",
                    max_line_length = 120,
                    sessions_window = {
                        active_sign = "  ",
                        inactive_sign = "  ",
                        current_line_sign = "",
                        border = {
                            style = "rounded",
                            text = {
                                top = " Sessions ",
                            },
                        },
                        win_options = {
                            winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                        },
                    },
                    keymaps = {
                        close = "<C-c>",
                        yank_last = "<C-k>",
                        yank_last_code = "<C-y>",
                        scroll_up = "<C-u>",
                        scroll_down = "<C-d>",
                        new_session = "<C-n>",
                        cycle_windows = "<Tab>",
                        cycle_modes = "<C-f>",
                        next_message = "<C-j>",
                        prev_message = "<C-k>",
                        select_session = "<Space>",
                        rename_session = "r",
                        delete_session = "d",
                        draft_message = "<C-r>",
                        edit_message = "e",
                        delete_message = "d",
                        toggle_settings = "<C-o>",
                        toggle_sessions = "<C-p>",
                        toggle_help = "<C-h>",
                        toggle_message_role = "<C-r>",
                        toggle_system_role_open = "<C-s>",
                        stop_generating = "<C-x>",
                    },
                },
                api_key_cmd = "gpg --decrypt " .. home .. "/.config/secrets/open_ai_key.txt.gpg",
                openai_params = {
                    model = "gpt-5.4-mini",
                    max_completion_tokens = 4096,
                    n = 1,
                },
                openai_edit_params = {
                    model = "gpt-4.1-mini",
                    temperature = "0.2",
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
