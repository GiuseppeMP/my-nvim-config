return {
    activation = 'Pipfile|requirements.txt|main.py|setup.py',
    config = {
        ['test/**/test_*.py'] = { type = "test", alternate = { "src/{dirname}/{basename}.py" } },
        ['test/*_test.py'] = { type = "test", alternate = { "src/{dirname}/{basename}.py" } },
        ['tests/**/test_*.py'] = { type = "test", alternate = { "src/{dirname}/{basename}.py" } },
        ['tests/*_test.py'] = { type = "test", alternate = { "src/{dirname}/{basename}.py" } },
        ['src/*.py'] = {
            type = "source",
            alternate = {
                "test/{dirname}/{basename}_test.py",
                "test/{dirname}/test_{basename}.py",
                "tests/{dirname}/{basename}_test.py",
                "tests/{dirname}/test_{basename}.py",
            }
        },
    }
}
