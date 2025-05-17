local function config()
    local g = vim.g
    g.ultest_use_pty = 1
    vim.cmd [[
        let g:test#java#maventest#test_command = "-DunitOnly=true"
        let test#custom_runners = {'Groovy': ['Maventest']}
        let g:test#js#jest#test_command = '--runInBand'
        let g:test#javascript#jest#test_command = '--runInBand'
    ]]

    g['test#strategy'] = {
        class = 'floaterm',
        suite = 'floaterm',
        nearest = 'floaterm',
        file = 'floaterm',
    }
end
return {
    { 'vim-test/vim-test', config = config },
}
