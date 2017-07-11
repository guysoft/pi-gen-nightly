#!/bin/bash
DIR=$(dirname $(realpath -s $BASH_SOURCE))
echo "jenkins ALL=(root) NOPASSWD: /usr/local/bin/raspbian_nightly" > /etc/sudoers.d/raspbian_nightly
echo "#!/usr/bin/env bash" > /usr/local/bin/raspbian_nightly
echo "pushd ${DIR}" >> /usr/local/bin/raspbian_nightly
echo "    ./run_vagrant_build.sh" >> /usr/local/bin/raspbian_nightly
echo "popd" >> /usr/local/bin/raspbian_nightly
chmod 755 /usr/local/bin/raspbian_nightly
sudo /etc/init.d/sudo restart
