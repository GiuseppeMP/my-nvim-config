return {
    -- activation in ruby
    activation = "etc/rbenv.d/|bin/rbenv-*",
    config = {
        -- projections for ruby
        ["bin/rbenv-*"] = {
            type = "command",
            template = { "#!/usr/bin/env bash" },
        },
        ["etc/rbenv.d/*.bash"] = { type = "hook" }
    },

}
