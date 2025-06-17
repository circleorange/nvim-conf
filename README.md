# nvim-conf

## Build

### Ubuntu

- Install neovim dependencies (Drop any unneeded):
```
sudo apt install gcc npm python3 luarocks unzip build-essential
```
- Install LaTex dependencies:
```
sudo apt install texlive-latex-extra biber latexmk texlive-bibtex-extra
```
- Install neovim plugin dependencies:
```
sudo npm install -g neovim
```
- Download latest version of Ubuntu (not available on apt):
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
```
- Extract neovim and place it into desired location:
```
tar -xvzf nvim-linux-x86_64
mv nvim-linux-x86_64 ~/.local/
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
- Cannot use Mason v2.0 due to missing nvim-java support (https://github.com/nvim-java/nvim-java/issues/384)


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
