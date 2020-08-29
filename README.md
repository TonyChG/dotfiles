# Setup

## junegunn/vim-plug

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## tmux-plugins/tpm

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## clvv/fasd

```bash
wget -q -O - https://github.com/clvv/fasd/tarball/1.0.1 | tar xzf - -C /tmp && cd /tmp/clvv-fsd* && PREFIX=$HOME make install && cd - && rm -rf /tmp/clvv-fast*
```

## neoclide/coc.nvim

```bash
curl -sL install-node.now.sh/lts | bash
```
