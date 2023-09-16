return {
    "ggandor/leap.nvim",
    config = function()
        local leap = require("leap")

        -- bi-directional search
        vim.keymap.set("n", "s", function()
            local current_window = vim.fn.win_getid()
            leap.leap { target_windows = { current_window } }
        end, { desc = "leap" })
    end
}
