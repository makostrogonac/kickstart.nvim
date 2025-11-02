-- Plugin: shahshlok/vim-coach.nvim
-- Installed via store.nvim

return {
    "shahshlok/vim-coach.nvim",
    dependencies = {
        "folke/snacks.nvim"
    },
    config = function()
        require("vim-coach").setup(

        )
    end,
    keys = {
        {
            "<leader>?",
            "<cmd>VimCoach<cr>",
            desc = "Vim Coach"
        }
    }
}