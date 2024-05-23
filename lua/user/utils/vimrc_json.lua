-- maybe needs to improve marks because multimodule projects (maven/gradle)
local root_markers = { 'pom.xml', 'gradlew', 'mvnw', '.git', 'settings.gradle', '.lsp_root', '.nvimrc.json' }

local root_dir = vim.fs.dirname(vim.fs.find(root_markers, { upward = true })[1])

local M = {}
--- return a lua table of the .nvimrc.json at workspace/project folder
---@return table
function M.load()
    -- get client workspace folder
    local project_settings = {}

    if root_dir == nil then
        return project_settings
    end

    -- lookup for the .nvimrc.json
    local lsp_path_settings = root_dir .. "/.nvimrc.json"

    if _G.utils.file_exists(lsp_path_settings) then
        -- load json string
        local fileSettings = io.open(lsp_path_settings, "r")
        if fileSettings ~= nil then
            project_settings = vim.json.decode(fileSettings:read("*a"))
        end
    end
    return project_settings
end

return M
