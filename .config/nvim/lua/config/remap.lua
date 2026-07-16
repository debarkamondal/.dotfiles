vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- [[ Basic Keymaps ]]
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex, { desc = "Open netrw" })
vim.keymap.set("n", "<leader>\\", ":Neotree toggle=true<CR>")
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- Better copy/paste
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Append bottom line to current
vim.keymap.set("n", "J", "mzJ`z")
--
-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
--
-- Go error snippet
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")
--
-- Split navigations
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>')
vim.keymap.set('n', '<leader>ss', ':split<CR>')
--
-- Tmux Navigator / Window Navigation
vim.keymap.set('n', "<c-h>", ":TmuxNavigateLeft<CR>" )
vim.keymap.set('n', "<c-j>", ":TmuxNavigateDown<CR>" )
vim.keymap.set('n', "<c-k>", ":TmuxNavigateUp<CR>" )
vim.keymap.set('n', "<c-l>", ":TmuxNavigateRight<CR>" )
--
-- Harpoon
vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end)
vim.keymap.set("n", "<C-e>", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>1", function() require("harpoon"):list():select(1) end)
vim.keymap.set("n", "<leader>2", function() require("harpoon"):list():select(2) end)
vim.keymap.set("n", "<leader>3", function() require("harpoon"):list():select(3) end)
vim.keymap.set("n", "<leader>4", function() require("harpoon"):list():select(4) end)
--
-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() require("harpoon"):list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() require("harpoon"):list():next() end)
--
-- Opencode
vim.keymap.set({ "n", "x" }, "<C-a>", function()
    require("opencode").ask("@this: ", { submit = true })
end, { desc = "Ask opencode…" })
vim.keymap.set({ "n", "x" }, "<C-x>", function()
    require("opencode").select()
end, { desc = "Execute opencode action…" })
vim.keymap.set("n", "<leader>ot", function()
    require("opencode").toggle()
end, { desc = "Toggle opencode" })
vim.keymap.set({ "n", "x" }, "go", function()
    return require("opencode").operator("@this ")
end, { desc = "Add range to opencode", expr = true })
vim.keymap.set("n", "goo", function()
    return require("opencode").operator("@this ") .. "_"
end, { desc = "Add line to opencode", expr = true })
vim.keymap.set("n", "<leader>ou", function()
    require("opencode").command("session.half.page.up")
end, { desc = "Scroll opencode up" })
vim.keymap.set("n", "<leader>od", function()
    require("opencode").command("session.half.page.down")
end, { desc = "Scroll opencode down" })
--
-- Misc
vim.keymap.set("i", "<C-c>", "<Esc>")
