return {
    {
        "simaxme/java.nvim",
        name = 'simaxmejava',
        config = function()
            require("java").setup {
                rename = {
                    enable = true,         -- enable the functionality for renaming java files
                    nvimtree = true,       -- enable nvimtree integration
                    write_and_close = true -- automatically write and close modified (previously unopened) files after refactoring a java file
                },
                snippets = {
                    enable = false -- enable the functionality for java snippets
                }
            }
        end
    },

}
