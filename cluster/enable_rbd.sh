#!/bin/bash
modprobe rbd
cat > /etc/rc.sysinit << EOF
#!/bin/bash
for file in /etc/sysconfig/modules/*.modules
do
  [ -x \$file ] && \$file
done
EOF
cat > /etc/sysconfig/modules/rbd.modules << EOF
modprobe rbd
EOF
chmod 755 /etc/sysconfig/modules/rbd.modules
lsmod |grep rbd
