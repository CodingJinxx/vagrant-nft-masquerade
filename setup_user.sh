sudo su -
useradd -m -d /home/$1 -s /bin/bash $1
echo -e "$2\n$2" | passwd $1'