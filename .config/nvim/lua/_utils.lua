local M = {}

function M.map(mode,key,to,opts)
  vim.api.nvim_set_keymap(
    mode,
    key,
    to,
    opts or {}
  )
end

M.colorscheme = "gruvbox-material"
M.Lcolorscheme = "gruvbox_material"

vim.api.nvim_exec([[
  let g:sonokai_style = 'andromeda'
  let g:sonokai_enable_italic = 1
  let g:sonokai_disable_italic_comment = 1

  let ayucolor="mirage"

  let g:gruvbox_material_background = 'medium'
  let g:gruvbox_material_enable_italic = 1
  let g:gruvbox_material_disable_italic_comment = 1
  let g:gruvbox_material_diagnostic_line_highlight = 1
  ]],{})

return M
