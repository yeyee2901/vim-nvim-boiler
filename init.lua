--             _                       _       _
--  _ ____   _(_)_ __ ___    _ __ ___ (_)_ __ (_)_ __ ___  _   _ _ __ ___
-- | '_ \ \ / / | '_ ` _ \  | '_ ` _ \| | '_ \| | '_ ` _ \| | | | '_ ` _ \
-- | | | \ V /| | | | | | | | | | | | | | | | | | | | | | | |_| | | | | | |
-- |_| |_|\_/ |_|_| |_| |_| |_| |_| |_|_|_| |_|_|_| |_| |_|\__,_|_| |_| |_|
--
--
--   ___ ___  _ __  / _(_) __ _
--  / __/ _ \| '_ \| |_| |/ _` |
-- | (_| (_) | | | |  _| | (_| |
--  \___\___/|_| |_|_| |_|\__, |
--                        |___/
-- yeyee2901 - 2021
--   - This file must be placed at ~/.config/nvim/
--   - Lua only works for Neovim > 0.5
--   - Also, please install 0.5.1 version since
--   there's a breaking change in Nvim & Telescope,
--   causing Telescope plugin
--   to segfault whenever calling Telescope @ Nvim 0.5.0
--   - This file is Lua representation of the .vimrc file on this repo
--   - To source the file:
--      :luafile ~/.config/nvim/init.lua
--      :luafile %

-- Single line strings may use ""  or ''
-- Multi line strings uses [[]]
-- Also, in Lua, function calls does not need () if you
-- pass in an arguments. If there's no arguments passed in,
-- you MUST use the ()
vim.cmd[[filetype indent plugin on]]

-- In Lua everything is a table (idiom to JS literal objects)
-- "local" vars are only known to the current file, and discarded
-- when the execution of the file ends. GLOBALS are vars that will
-- be known across ALL the runtime path of neovim.
--  :set rtp?
local opts = {
  clipboard = "unnamedplus",
  mouse = "",
  swapfile = false,   -- no in Vimscript translates to false in Lua

  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  smartindent = true,
  smarttab = true,
  wrap = false,

  ignorecase = true,

  timeout = true,
  timeoutlen = 2000,

  hlsearch = false,

  hidden = true,

  cursorline = true,

  splitbelow = true,
  splitright = true,
}

-- Traverse the table and set the options using
--  vim.opt
--  see :h vim.opt for more infos on what the API can do
for option, value in pairs(opts) do
  vim.opt[ option ] = value
end

-- REMAPPING KEYS
-- Wrapper function for remaps
-- Functions in Lua are like Javascript, where
-- they're anonymus by default. You have to assign it to
-- a var / or give it a name:
--
--     local function _noremap()
--          -- function body
--     end
--
--     local _noremap = function()
--          -- function body
--     end

local _noremap = function(mode, key, map_to)
  vim.api.nvim_set_keymap(mode, key, map_to, {noremap = true, silent = false})
end

local _noremap_silent = function(mode, key, map_to)
  vim.api.nvim_set_keymap(mode, key, map_to, {noremap = true, silent = true})
end

-- Map <leader> key to SPACE
-- vim.g are globals
_noremap('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

_noremap( 'n', '<S-h>', '<cmd>set hl<CR>' )

-- Make <S-y> behave the same as <S-d> & <S-c>
_noremap( 'n', '<S-y>', 'y$' )


-- VISUAL MODE ---------------
_noremap_silent( 'v', '<silent>', '<Tab> >gv' )

-- Visual select + decrease indent
_noremap_silent( 'v', '<silent>', '<S-Tab> <gv' )
_noremap_silent( 'v', '<silent>', '<BS> xgv' )


-- Window Keymappings --------
-- Navigation - 90% of ppl use these kind of keymap
_noremap( 'n', '<C-h>', '<C-w>h' )
_noremap( 'n', '<C-j>', '<C-w>j' )
_noremap( 'n', '<C-k>', '<C-w>k' )
_noremap( 'n', '<C-l>', '<C-w>l' )

-- splits
-- Vertical
_noremap( 'n', 'sv', '<C-w>v' )

-- Horizontal
_noremap( 'n', 'sh', '<C-w>s' )

-- Close split
_noremap( 'n', 'sq', '<C-w>q' )

-- rotate splits
_noremap( 'n', 'sr', '<C-w><C-r>' )

-- Window / split resizing
-- Resize vertical
_noremap( 'n', '<M-h>', '<C-w><' )
_noremap( 'n', '<M-l>', '<C-w>>' )

-- Resize horizontal
_noremap( 'n', '<M-k>', '<C-w>+' )
_noremap( 'n', '<M-j>', '<C-w>-' )


-- Tab Keymappings -----------
-- Feel free to use if you're a tab person like me
_noremap( 'n', '<Tab>n', ':tabnew<CR>' )
_noremap( 'n', '<Tab>q', ':tabclose<CR>' )
_noremap( 'n', '<Tab>l', ':tabnext<CR>' )
_noremap( 'n', '<Tab>h', ':tabprevious<CR>' )


-- Unfortunately, atm, there are no APIs for autocmds,
-- so we have to manually set it using vim.cmd[[]]
vim.cmd[[
    augroup C_FILE_LIKE_INDENT
        autocmd!
        autocmd FileType c,cpp,objc,objcpp,lua,php,javascript,html,css set tabstop=2
        autocmd FileType c,cpp,objc,objcpp,lua,php,javascript,html,css set softtabstop=2
        autocmd FileType c,cpp,objc,objcpp,lua,php,javascript,html,css set shiftwidth=2
    augroup END
]]

-- For single line options you can also use
-- vim.cmd even though you can use vim.opt
-- vim.cmd[[set termguicolors]]
vim.opt.termguicolors = true

-- There's also no API for setting highlight,
-- manual again
vim.cmd[[hi Normal ctermbg=NONE]]
vim.cmd[[hi LineNr ctermbg=NONE]]
vim.cmd[[hi SignColumn ctermbg=NONE]]
vim.cmd[[hi LineCursor term=NONE cterm=NONE]]

-- Line Cursor
-- The colors for LineCursor are set from the guibg property
vim.cmd[[hi LineCursor term=NONE cterm=NONE ctermbg=Gray guibg=#300840]]


-- Builtin File explorer -------------
-- Remove this option if you already use other file explorer plugin
_noremap( 'n', '<Leader>n', ':Lexplore<CR>' )

-- Vim 'Global' vars identifier are accesed using .g
-- there are also .s (local to script), and .b (local to buffer)
-- identifier
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 20

-- Terminal
_noremap( 'n', '<Leader>t', ':terminal<CR>' )
