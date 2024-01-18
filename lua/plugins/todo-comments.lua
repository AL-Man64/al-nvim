return {
    "folke/todo-comments.nvim",

    lazy = false,

    dependencies = { "nvim-lua/plenary.nvim" },

    opts = {
        signs = true,
        sign_priority = 8,
        keywords = {
            -- FIX:
            FIX = {
                icon = " ",
                color = "error",
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
            },
            -- TODO:
            TODO = { icon = " ", color = "info" },
            -- HACK:
            HACK = { icon = " ", color = "warning" },
            -- WARN:
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            -- PERF:
            PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            -- NOTE:
            NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
            -- TEST:
            TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        gui_style = {
            fg = "NONE",
            bg = "BOLD",
        },
        merge_keywords = true,
        highlight = {
            multiline = true,
            multiline_pattern = "^.",
            multiline_context = 10,
            before = "",
            keyword = "wide",
            after = "fg",
            pattern = [[.*<(KEYWORDS)\s*:]],
            comments_only = true,
            max_line_len = 400,
            exclude = {},
        },
        colors = {
            error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
            warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
            info = { "DiagnosticInfo", "#2563EB" },
            hint = { "DiagnosticHint", "#10B981" },
            default = { "Identifier", "#7C3AED" },
            test = { "Identifier", "#FF00FF" }
        },
        search = {
            command = "rg",
            args = {
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
            },
            pattern = [[\b(KEYWORDS):]],
        },
    },
    config = function()
        require("todo-comments").setup()
        vim.keymap.set("n", "<leader>wt", "<cmd>TodoQuickFix<cr>", { desc = "[W]orkspace [T]odos" })
    end
}