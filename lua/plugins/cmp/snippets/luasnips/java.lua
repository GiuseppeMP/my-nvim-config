local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local r = require("luasnip.extras").rep
local f = ls.function_node

local java_snippets = {
    s("j5", {
        -- Dynamically generate the package declaration for src/test/java
        f(function()
            local file_path = vim.fn.expand("%:p")                           -- Get full path of current file
            local project_root = vim.fn.finddir(".git/..", file_path .. ";") -- Find project root
            local relative_path = file_path:sub(#project_root + 1):gsub("/", "."):gsub("%.java$", "")
            local package_name = relative_path:match("src%.test%.java%.(.*)%..*$") or "com.example.test"
            return "package " .. package_name .. ";"
        end),
        t({ "", "" }),
        t({ "", "import org.junit.jupiter.api.Test;" }),
        t({ "", "import static org.assertj.core.api.Assertions.assertThat;" }),
        t({ "", "" }),
        t({ "", "public class " }),
        -- Automatically set the class name based on the filename
        f(function()
            return vim.fn.expand("%:t:r")
        end),
        t({ " {", "", "   " }),
        -- Check if the class name ends with "Test"
        f(function()
            local class_name = vim.fn.expand("%:t:r")
            if class_name:match("Test$") then
                -- Remove the "Test" suffix and use the remaining name as the variable name
                local base_class_name = class_name:sub(1, -5) -- Remove "Test" from the name
                return "private " .. base_class_name .. " " .. base_class_name:lower() .. ";"
            else
                return "" -- No extra line if the class name doesn't end with "Test"
            end
        end),
        t({ "", "    " }),
        -- Add empty line before the method
        t({ "", "    @Test", "    public void should_" }),
        -- Automatically generate method name from class name
        f(function()
            local class_name = vim.fn.expand("%:t:r")
            return class_name:sub(1, -5):lower() .. "_" -- Generate the test method name (without "Test")
        end),
        i(1, "___"),                                    -- Stop cursor waiting method tst name
        t({ "(" }),                                     -- Stop cursor waiting params declaration
        i(2, ""),
        t({ ") {", "    " }),
        t({ "   assertThat(car).isNotNull();" }),
        t({ "", "       " }),
        i(0), -- Cursor for typing the method name
        t({ "", "    }", "}" }),
    }),
    s("cls", {
        -- Dynamically generate the package declaration
        f(function()
            local file_path = vim.fn.expand("%:p")
            local project_root = vim.fn.finddir(".git/..", file_path .. ";")
            local relative_path = file_path:sub(#project_root + 1):gsub("/", "."):gsub("%.java$", "")
            local package_name = relative_path:match("src%.main%.java%.(.*)%..*$") or "com.example"
            return "package " .. package_name .. ";"
        end), --
        t({ "", "", "public class " }),
        -- Automatically set the class name based on the filename
        f(function()
            return vim.fn.expand("%:t:r")
        end),
        t({ " {", "    " }),
        i(0), -- Final cursor position
        t({ "", "}" }),
    }),
    s("print_str", {
        t("print(\""),
        i(1, "desrc"),
        t("\")"),
    }),
    s("print_var1", {
        t("print(\""),
        i(1, "desrc"),
        t(": \" .. "),
        i(2, "the_variable"),
        t(")"),
    }),
    s("print_var2", {
        t("print(\""),
        i(1, "the_variable"),
        t(": \" .. "),
        r(1),
        t(")"),
    }),
    s("print_var3", {
        t("print(\""),
        i(1, "desrc"),
        t(" | "),
        i(2, "the_variable"),
        t(" : \" .. "),
        r(2),
        t(")"),
    }),
}
ls.add_snippets("java", java_snippets)
