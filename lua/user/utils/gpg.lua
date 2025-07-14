local M = {}
local home = os.getenv("HOME")
local open_ia = home .. "/.config/secrets/open_ai_key.txt.gpg"
local claude_key = home .. "/.config/secrets/claude_key.txt.gpg"
local grok4_key = home .. "/.config/secrets/grok4_key.txt.gpg"
local gemini_key = home .. "/.config/secrets/gemini_key.txt.gpg"
local tavily_key = home .. "/.config/secrets/tavily_key.txt.gpg"
local openrouter_key = home .. "/.config/secrets/openrouter_key.txt.gpg"


function M.decrypt_file(file_path)
    local content = vim.fn.system("gpg --decrypt -q --batch --no-tty " .. file_path)
    return vim.fn.trim(content)
end

function M.decrypt_openai_key()
    return M.decrypt_file(open_ia)
end

function M.decrypt_claude_key()
    return M.decrypt_file(claude_key)
end

function M.decrypt_grok4_key()
    return M.decrypt_file(grok4_key)
end

function M.decrypt_gemini_key()
    return M.decrypt_file(gemini_key)
end

function M.decrypt_tavily_key()
    return M.decrypt_file(tavily_key)
end

function M.decrypt_openrouter_key()
    return M.decrypt_file(openrouter_key)
end

return M
