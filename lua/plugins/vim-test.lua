local function config()
    local g = vim.g
    g.ultest_use_pty = 1
    vim.cmd [[
        let  g:test#java#maventest#test_command = "-DunitOnly=true"
        let test#custom_runners = {'Groovy': ['Maventest']}
    ]]

    g['test#strategy'] = {
        class = 'floaterm',
        suite = 'floaterm',
        nearest = 'floaterm',
        file = 'floaterm',
    }

    vim.cmd [[ command! -nargs=* -bar DebugTestNearest call test#run('debug_nearest', split(<q-args>)) ]]

    vim.cmd [[ command! -nargs=* -bar DebugTestFile call test#run('debug_file', split(<q-args>)) ]]
end
return {
    { 'vim-test/vim-test', config = config },
}
