#!/bin/bash
set -xe

# enable and start dhcp on ethernet interface
systemctl enable dhcpcd@enp5s0
systemctl start dhcpcd@enp5s0

# download required packages
pacman -Sy --noconfirm python2 openssh

# insert ssh key into the authorized_keys
mkdir -p ~/.ssh

set +e
cat > ~/.ssh/authorized_keys <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMojr5FJS9LuK27pVK5zQARZo9mEEsJ6HiyRiiVlZnaJaY6ZCVHMwnb07EyCJtN8fBd7JXUbVGevZnDzEzDRWMMd7zUGqMtiNABiFHiOA0+sNDBWs3gb5VD/IOkbnY/ocW4uiUAAan0n6O97cKBjYEwhv6TlrLSHe78EjU0Nb1AYMKkKYYA097D51wZnpGPVCgmBMQ5WgZNnaqskSKFocqoPzJnldoz6tVtzu5jKxMnaXAaCBChD8XqVYkbfVPBg+kgvSKj9sIZbCpjGyA6pUvzAAbCKaJKninSEs5zWL9CpI1dQMYNdrI+MIJn39vw5cA9RbceDvlPd/6scxOshBn maxime.vidori@gmail.com
EOF
set -e

# enable and start sshd
systemctl enable sshd
systemctl start sshd
