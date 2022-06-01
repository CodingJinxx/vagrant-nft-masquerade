sudo su -
useradd -m -d /home/$1 -s /bin/bash $1
echo -e "$2\n$2" | passwd $1
cp -pr /home/vagrant/.ssh /home/$1/.ssh
echo -e "%$1 ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$1
