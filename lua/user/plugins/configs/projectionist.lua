local g = vim.g

g.projectionist_heuristics = {
    -- activation in ruby
    ["etc/rbenv.d/|bin/rbenv-*"] = {
        -- projections for ruby
        ["bin/rbenv-*"] = {
            type = "command",
            template = { "#!/usr/bin/env bash" },
        },
        ["etc/rbenv.d/*.bash"] = { type = "hook" }
    },
    -- activation in java projects
    ['pom.xml|build.gradle|settings.gradle'] = {

        -- projections for java
        ['src/main/java/*.java'] = {
            type = "source",
            alternate = { "src/test/java/{}Test.java", "src/test/java/{}ITCase.java", "src/test/java/{}Tests.java",
                "src/test/java/{}IT.java" },
        },
        ['src/test/java/*Test.java'] = {
            type = "test",
            alternate = "src/main/java/{}.java"
        },
        ['src/test/java/*IT.java'] = {
            type = "test",
            alternate = "src/main/java/{}.java"
        },
        ['src/test/java/*Tests.java'] = {
            type = "test",
            alternate = "src/main/java/{}.java"
        },
        ['src/test/java/*ITCase.java'] = {
            type = "test",
            alternate = "src/main/java/{}.java"
        }
    },

    -- activation in python
    -- ['Pipfile|requirements.txt|main.py'] = {
    --     ['test_*.py'] = {
    --         type = "test",
    --         alternate = {
    --             "{}.py",
    --         }
    --     },
    --     ['*test.py'] = {
    --         type = "test",
    --         alternate = {
    --             "{}.py",
    --         }
    --     },
    --     ['*.py'] = {
    --         type = "src",
    --         alternate = {
    --             -- same dir tests
    --             "{file|dirname}/test_{basename}.py",
    --             "{}_test.py",
    --             "{file|dirname}/test_{basename}.py",
    --             -- "{file|dirname}/{}_test.py",
    --             -- create /tests in same dir
    --             "{file|dirname}/tests/{basename}_test.py",
    --             "{file|dirname}/tests/test_{basename}.py",
    --             -- create /tests in the root dir
    --             -- "{project}/tests{dirname}/test_{basename}.py",
    --             -- "tests/{dirname}/{basename}_test.py",
    --         }
    --     }
    -- },
    -- activation in javascript/typescript
    ['settings.json|.nodejs|.angular|.react|tsconfig.json'] = {

        -- projections for tsx
        ['src/*.ts'] = {
            alternate = "src/{}.test.ts" },
        ['src/*.test.ts'] = {
            alternate = "src/{}.ts"
        },
        -- projections for tsx
        ['src/*.tsx'] = {
            alternate = "src/{}.test.tsx"
        },
        ['src/*.test.tsx'] = {
            alternate = "src/{}.tsx"
        },
        -- projections for js
        ['src/*.js'] = {
            alternate = "src/{}.test.js"
        },
        ['src/*.test.js'] = {
            alternate = "src/{}.js"
        },
        -- projections for jsx
        ['src/*.jsx'] = {
            alternate = "src/{}.test.jsx"
        },
        ['src/*.test.jsx'] = {
            alternate = "src/{}.jsx"
        }
    }
}

M = {}

M.create_projectionist_cmd = function()
    vim.api.nvim_create_augroup("_projectionist", {})
    vim.api.nvim_create_autocmd(
        { "BufWinEnter" },
        {
            group = "_projectionist",
            callback = function()
                vim.cmd [[ ]]
            end,
        }
    )
end

M.create_projectionist_cmd()
