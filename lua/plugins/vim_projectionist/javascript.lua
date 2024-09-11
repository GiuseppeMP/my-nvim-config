return {
    -- activation in javascript/typescript
    activation = 'settings.json|.nodejs|.angular|.react|tsconfig.json|jsconfig.json|jsconfig.js',
    config = {

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
