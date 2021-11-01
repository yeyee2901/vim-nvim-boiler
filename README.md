# Go-to Main Plugins after Understanding Vim & Nvim Config
## Plugin Manager
- Lua based plugin manager - https://github.com/wbthomason/packer.nvim

## Dashboard
- https://github.com/mhinz/vim-startify

## File Tree Explorer
- https://github.com/kyazdani42/nvim-tree.lua  
    requires = https://kyazdani42/nvim-web-devicons (for file icons),  
    also, your terminal needs Nerd Font for it to work. I use JetBrains Mono NerdFont.

## Colorscheme options, I use Nord.nvim
- https://github.com/shaunsingh/nord.nvim
- https://github.com/tanvirtin/monokai.nvim
- https://github.com/tomasiser/vim-code-dark
- https://github.com/ayu-theme/ayu-vim
- https://github.com/folke/tokyonight.nvim
- https://github.com/ray-x/aurora
- https://github.com/hoob3rt/lualine.nvim

## Show Hex color
- https://github.com/norcalli/nvim-colorizer.lua

## For Heavy C/C++
- https://github.com/cdelledonne/vim-cmake

## LSP Experience
#### Main LSP
- Main plugin - https://github.com/neovim/nvim-lspconfig
- Show function signatures while typing - https://github.com/ray-x/lsp_signature.nvim
- Better UI - https://github.com/glepnir/lspsaga.nvim

#### Completion Engine
- https://github.comhrsh7th/nvim-cmp  
  requires =
    - https://github.com/hrsh7th/cmp-nvim-lsp',
    - https://github.com/'hrsh7th/cmp-buffer',
    - https://github.com/'hrsh7th/cmp-path',
    - https://github.com/SirVer/ultisnips
    - https://github.com/honza/vim-snippets
    - https://quangnguyen30192/cmp-nvim-ultisnips

## TreeSitter
- https://github.com/nvim-treesitter/nvim-treesitter  
- optional - https://github.com/nvim-treesitter/playground
- Define custom text objects - https://github.com/nvim-treesitter/nvim-treesitter-textobjects

## Telescope - Ultimate Fuzzy Finder
- https://github.com/nvim-telescope/telescope.nvim  
  requires = 
  - https://github.com/nvim-lua/popup.nvim
  - https://github.com/nvim-lua/plenary.nvim

#### Telescope Extensions
- Insert symbols & Emoji - https://github.com/nvim-telescope/telescope-symbols.nvim
- Optional, better search speed performance - https://github.com/nvim-telescope/telescope-fzy-native.nvim
- https://github.com/fhill2/telescope-ultisnips.nvim  
  requires = https://github.com/SirVer/ultisnips
- Project manager, git based - https://github.com/nvim-telescope/telescope-project.nvim

- Git integration - https://github.com/tpope/vim-fugitive

## Snippets
- https://github.com/SirVer/ultisnips
- https://github.com/honza/vim-snippets

## Auto close brackets, quotes, etc
- https://github.com/jiangmiao/auto-pairs

## Change surrounding tags / quotes / anything that surrounds
- https://github.com/tpope/vim-surround

## Comment out lines. Supports wide variety of languages.
- https://github.com/tpope/vim-commentary

## Multi Cursor like VSCode & Sublime
- https://github.com/mg979/vim-visual-multi

## Remote Editing Features with SSH
- https://github.com/chipsenkbeil/distant.nvim
