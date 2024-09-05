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
            ['**/tests/*test_*.py'] = {
                type = "test",
                alternate = {
                    "src/{}.py",
                }
            },
            ['**/tests/*_test.py'] = {
                type = "test",
                alternate = {
                    "src/{}.py",
                }
            },
            ['**/src/*.py'] = { alternate = { "tests/{}_test.py", "tests/test_{}.py" } },
        },
        -- golang activation
        ['go.mod|go.sum'] = {
            ['*.go'] = { alternate = "{}_test.go" },
            ['*_test.go'] = { alternate = "{}.go", type = 'test' },
        },
        -- activation in javascript/typescript
        ['settings.json|.nodejs|.angular|.react|tsconfig.json|jsconfig.json|jsconfig.js'] = {

            -- projections for tsx
            ['*.ts'] = {
                alternate = "{}.test.ts" },
            ['*.test.ts'] = {
                alternate = "{}.ts",
                type = "test"
            },
            -- projections for tsx
            ['*.tsx'] = {
                alternate = "{}.test.tsx"
            },
            ['*.test.tsx'] = {
                alternate = "{}.tsx"
            },
            -- projections for js
            ['*.js'] = {
                alternate = { "*.xslt.test.js", "{}.test.js", "{}.spec.js" },
            },
            ['*.xslt'] = {
                alternate = { "{}.xslt.test.js" },
            },
            ['*.test.js'] = {
                alternate = { "{}.js", "{}" },
            },
            ['*.spec.js'] = {
                alternate = "{}.js"
            },
            ['*.xslt.test.js'] = {
                alternate = "{}.js"
            },
            -- projections for jsx
            ['*.jsx'] = {
                alternate = "{}.test.jsx"
            },
            ['*.test.jsx'] = {
                alternate = "{}.jsx"
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
