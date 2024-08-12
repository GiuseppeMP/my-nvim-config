local function config()
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
        ['pom.xml|build.gradle|settings.gradle|gradle.properties|gradlew'] = {

            -- projections for java
            ['src/main/java/*.java'] = {
                type = "source",
                alternate = { "src/test/java/{}Test.java", "src/test/java/{}ITCase.java", "src/test/java/{}Tests.java", "src/test/java/{}IT.java", "src/test/java/{}Spec.java" },
            },
            ['src/main/groovy/*.groovy'] = {
                -- type = "source",
                alternate = {
                    "src/test/groovy/{}Test.groovy",
                    "src/test/groovy/{}ITCase.groovy",
                    "src/test/groovy/{}Tests.groovy",
                    "src/test/groovy/{}Spec.groovy",
                    "src/test/groovy/{}IT.groovy"
                },
            },
            ['src/test/groovy/*Test.groovy'] = {
                type = "test",
                alternate = "src/main/groovy/{}.groovy"
            },
            ['src/test/groovy/*Spec.groovy'] = {
                type = "test",
                alternate = "src/main/groovy/{}.groovy"
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
        ['Pipfile|requirements.txt|main.py|setup.py'] = {
            ['tests/test_*.py'] = {
                type = "test",
                alternate = {
                    "src/{}.py",
                }
            },
            ['tests/*_test.py'] = {
                type = "test",
                alternate = {
                    "src/{}.py",
                }
            },
            ['src/*.py'] = {
                type = "src",
                alternate = {
                    "tests/{}_test.py",
                    "tests/test_{}.py",
                    -- same dir tests
                    -- "{file|dirname}/test_{basename}.py",
                    -- "{}_test.py",
                    -- "{file|dirname}/test_{basename}.py",
                    -- "{file|dirname}/{}_test.py",
                    -- create /tests in same dir
                    -- "{file|dirname}/tests/{basename}_test.py",
                    -- "{file|dirname}/tests/test_{basename}.py",
                    -- create /tests in the root dir
                    -- "{project}/tests{dirname}/test_{basename}.py",
                    -- "tests/{dirname}/{basename}_test.py",
                }
            }
        },
        -- golang activation
        ['go.mod|go.sum'] = {
            ['*.go'] = { alternate = "{}_test.go" },
            ['*_test.go'] = { alternate = "{}.go", type = 'test' },
        },
        -- activation in javascript/typescript
        ['settings.json|.nodejs|.angular|.react|tsconfig.json|jsconfig.json|jsconfig.js'] = {

            -- projections for tsx
            ['src/*.ts'] = {
                alternate = "src/{}.test.ts" },
            ['src/*.test.ts'] = {
                alternate = "src/{}.ts",
                type = "test"
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
                alternate = { "src/*.xslt.test.js", "src/{}.test.js", "src/{}.spec.js" },
            },
            ['src/*.xslt'] = {
                alternate = { "src/{}.xslt.test.js" },
            },
            ['src/*.test.js'] = {
                alternate = { "src/{}.js", "src/{}" },
            },
            ['src/*.spec.js'] = {
                alternate = "src/{}.js"
            },
            ['src/*.xslt.test.js'] = {
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

    -- M.create_projectionist_cmd()
end

return {
    { 'tpope/vim-projectionist', event = 'VeryLazy', config = config },
}
