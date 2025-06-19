return {
	"rose-pine/neovim",
	-- 'xiyaowong/transparent.nvim',
	name = "rose-pine",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("rose-pine").setup({
			enable = {
				terminal = true,
			},
			styles = {
				bold = true,
				italic = true,
				comments = { italic = false }, -- Disable italics in comments
			},
		})
		vim.cmd.colorscheme("rose-pine-moon")
	end,
}
