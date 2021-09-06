local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- map the leader key
map('n', '<Space>', '')

-- map fuzzy finder
map('n', 'ff', '<cmd>Telescope find_files<cr>')
map('n', 'fg', '<cmd>Telescope live_grep<cr>')
map('n', 'fb', '<cmd>Telescope buffers<cr>')
map('n', 'fh', '<cmd>Telescope help_tags<cr>')


