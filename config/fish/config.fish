if status is-interactive
    # Commands to run in interactive sessions can go here
end

# FZF key bindings
fzf_configure_bindings --git_log=\cb --git_status=\cs --history=\cr --variables=\cu --directory=\ct
set -x FZF_DEFAULT_OPTS "\
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--cycle \
--border \
--height 90% \
--layout=reverse \
--preview-window=wrap \
--marker='*' \
"
set -x FZF_DEFAULT_COMMAND "fdfind --hidden"
set -x MARS_PATH ~/repo/mars
set -x GEM_PATH ~/.gem/bin
set -x ENABLE_RUST_BACKEND 1
set -x WSL2_HOST_IP (cat /etc/resolv.conf | grep nameserver | cut -d ' ' -f 2)

# set -Ua SSH_KEYS_TO_AUTOLOAD ~/.ssh/id_ed25519

fish_add_path ~/.local/bin
fish_add_path ~/.local/share/bob/nvim-bin
fish_add_path ~/.cargo/bin
fish_add_path /home/linuxbrew/.linuxbrew/bin
# fish_add_path $GEM_PATH
# fish_add_path ~/repo/c-capnproto
# fish_add_path /opt/arm-gnu-toolchain-13.2.Rel1-x86_64-arm-none-eabi/bin
# fish_add_path /mnt/c/tools/openocd/bin
