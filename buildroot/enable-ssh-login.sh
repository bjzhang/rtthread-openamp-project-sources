#/bin/bash -x

cd $1
SSHD_CFG=etc/ssh/sshd_config
echo "Match Address 10.0.2.*" >> $SSHD_CFG
echo -e "\tPermitRootLogin yes" >> $SSHD_CFG
