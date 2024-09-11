return {
    activation = 'Pipfile|requirements.txt|main.py|setup.py',
    config = {
        ['**/test_*.py'] = {
            type = "test",
            alternate = {
                "{}.py",
            }
        },
        ['*.py'] = {
            type = "source",
            alternate = {
                "{dirname}/test_{basename}.py",
            }
        },
        ['**/tests/*_test.py'] = {
            type = "test",
            alternate = {
                "src/{}.py",
            }
        },
        ['**/tests/test_*.py'] = {
            type = "test",
            alternate = {
                "src/{}.py",
            }
        },
        ['**/src/*.py'] = { alternate = { "tests/{}_test.py", "tests/test_{}.py" } },
    }
}
