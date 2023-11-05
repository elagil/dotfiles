if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux WSL2_HOST_IP (cat /etc/resolv.conf | grep nameserver | cut -d ' ' -f 2)

fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path /opt/arm-gnu-toolchain-13.2.Rel1-x86_64-arm-none-eabi/bin
fish_add_path /mnt/c/tools/openocd/bin
