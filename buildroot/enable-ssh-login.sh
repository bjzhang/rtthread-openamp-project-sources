#/bin/bash -x

cd $1
sed "s/^root::/root:\$1\$4f0YW3nK\$9psfLsrngu4mniQvJw5.N1:/g" etc/shadow -i
#sed "s/#PermitRootLogin.*$/PermitRootLogin yes/g"  etc/ssh/sshd_config -i
