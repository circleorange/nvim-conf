# Neovim Configurations

## Plugins
- LSP management: "neovim/nvim-lspconfig", "mason-org/mason-lspconfig.nvim", "mason-org/mason.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim",
- Code & Motions: "nvim-treesitter/nvim-treesitter", "aaronik/treewalker.nvim", "folke/flash.nvim", 
- Completions: "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets", "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "onsails/lspkind.nvim"
- "folke/snacks.nvim": LSP functions, File Explorer, Picker, Lazygit, etc.
- "echasnovski/mini.nvim": mini.pairs, mini.ai
- Git: "NeogitOrg/neogit", 
- Language specific: "folke/lazydev.nvim", "benlubas/molten-nvim"

## Build

### Ubuntu

- Install neovim dependencies (Drop any unneeded):
```
sudo apt install gcc npm python3 luarocks unzip build-essential fd-find
```
- Optional, Install LaTex dependencies:
```
sudo apt install texlive-latex-extra biber latexmk texlive-bibtex-extra
```
- Install npm plugin dependencies:
```
sudo npm install -g neovim tree-sitter-cli
```
- Download latest version of Neovim (not available on Ubuntu apt):
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
```
- Extract neovim and place it into desired location:
```
tar -xvzf nvim-linux-x86_64
mv nvim-linux-x86_64 ~/.local/
rm nvim-linux-x86_64.tar.gz
```
- In .bashrc, add the PATH to neovim:
```
export PATH="$HOME/.local/nvim-linux-x86_64/bin:$PATH"
source ~/.bashrc
```
- Verify installation:
```
nvim --version
```

## Issues
- nvim-java not compatible with Mason v2.0 (https://github.com/nvim-java/nvim-java/issues/384)

## Potential Plugins
- "zeioth/compiler.nvim"
- harpoon

## nvim commands
`:lua print(vim.inspect(require("jdtls")))`

## References
