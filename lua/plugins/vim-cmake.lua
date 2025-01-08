return {
    'cdelledonne/vim-cmake',
    cmd = {
        'CMakeGenerate',
        'CMakeClean',
        'CMakeBuild',
        'CMakeInstall',
        'CMakeRun',
        'CMakeTest',
        'CMakeSwitch',
        'CMakeOpen',
        'CMakeClose',
        'CMakeToggle',
        'CMakeCloseOverlay',
        'CMakeStop',
    },
    keys = {
        { "\\g", "<cmd>CMakeGenerate<cr>",     desc = "CMakeGenerate" },
        { "\\c", "<cmd>CMakeClean<cr>",        desc = "CMakeClean" },
        { "\\b", "<cmd>CMakeBuild<cr>",        desc = "CMakeBuild" },
        { "\\i", "<cmd>CMakeInstall<cr>",      desc = "CMakeInstall" },
        { "\\t", "<cmd>CMakeTest<cr>",         desc = "CMakeTest" },
        { "\\s", "<cmd>CMakeSwitch<cr>",       desc = "CMakeSwitch" },
        { "\\o", "<cmd>CMakeOpen<cr>",         desc = "CMakeOpen" },
        { "\\c", "<cmd>CMakeClose<cr>",        desc = "CMakeClose" },
        { "\\T", "<cmd>CMakeToggle<cr>",       desc = "CMakeToggle" },
        { "\\C", "<cmd>CMakeCloseOverlay<cr>", desc = "CMakeCloseOverlay" },
        { "\\S", "<cmd>CMakeStop<cr>",         desc = "CMakeStop" },
    },

    init = function()
        vim.g.cmake_link_compile_commands = 1
        vim.g.cmake_root_markers = { 'CMakeLists.txt', }
    end,

}
