local map = function(mode, left, right, desc)
  local opts = { noremap = true, silent = true }
  if desc then
    opts.desc = desc
  end

  vim.keymap.set(mode, left, right, opts)
end

local nmap = function(left, right, desc)
  map("n", left, right, desc)
end

local imap = function(left, right, desc)
  map("i", left, right, desc)
end

imap("<C-h>", "<Left>")
imap("<C-j>", "<Down>")
imap("<C-k>", "<Up>")
imap("<C-l>", "<Right>")

nmap("<leader>x", ":bd<CR>", "close buffer")
