return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")
        local nmap = function(left, right, desc)
            vim.keymap.set("n", left, right, { desc = desc })
        end

        nmap("<leader>ff", builtin.find_files, "find files")
        nmap("<leader>fg", builtin.live_grep, "grep")
        nmap("<leader>fb", builtin.buffers, "find buffers")
        nmap("<leader>fd", builtin.diagnostics, "find diagnostics")
    end
}
