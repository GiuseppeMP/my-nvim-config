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
            alternate = { "src/test/java/{}Test.java", "src/test/java/{}IT.java" },
        },
        ['src/test/java/*Test.java'] = {
            type = "test",
            alternate = "src/main/java/{}.java"
        },
        ['src/test/java/*IT.java'] = {
            type = "test",
            alternate = "src/main/java/{}.java"
        }
    },
    -- activation in javascript/typescript
    ['settings.json|.nodejs|.angular|.react|tsconfig.json'] = {

        -- projections for tsx
        ['src/*.ts'] = {
            alternate = "src/{}.test.ts"
        },
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
