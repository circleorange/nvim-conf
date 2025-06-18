# nvim-conf

## Build

### Ubuntu

- Install neovim dependencies (Drop any unneeded):
```
sudo apt install gcc npm python3 luarocks unzip build-essential
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


## Plugins

### Motions
- aaronik/treewalker.nvim: Move around code in syntax tree aware manner.

### Language Support

- C:    Uses clangd
- Java: "nvim-java", with potential replacement "nvim-jdtls" but requires more manual setup.
- Python: Using pyright, however, potential replacement can be ruff (refer to LazyVim implementation).
- Docker: Uses dockerls

## Potential Plugins
- "zeioth/compiler.nvim"

## nvim commands
`:lua print(vim.inspect(require("jdtls")))`

## References
