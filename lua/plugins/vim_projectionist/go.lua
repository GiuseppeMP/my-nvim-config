return {
    activation = 'go.mod|go.sum',
    config = {
        ['*.go'] = { alternate = "{}_test.go" },
        ['*_test.go'] = { alternate = "{}.go", type = 'test' },
    },

}
