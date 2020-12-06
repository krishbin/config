local M= {}
local map=require('_utils').map

local function create_mapping()
  vim.api.nvim_exec([[
    let g:UltiSnipsExpandTrigger="<C-y>"
    let g:UltiSnipsJumpForwardTrigger="<c-y>"
    let g:UltiSnipsJumpBackwardTrigger="<c-e>"
    ]],{})
end

M.setup = function ()
  create_mapping()
end

return M
