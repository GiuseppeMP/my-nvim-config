local M = {}
local home = os.getenv("HOME")
local open_ia = home .. "/.config/secrets/open_ai_key.txt.gpg"

function M.decrypt_file(file_path)
    local content = vim.fn.system("gpg --decrypt -q --batch --no-tty " .. file_path)
    return vim.fn.trim(content)
end

function M.decrypt_openai_key()
    return M.decrypt_file(open_ia)
end

return M
