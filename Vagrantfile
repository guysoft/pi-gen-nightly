Vagrant.configure("2") do |o|
    o.vm.box= "debian/stretch64"
    o.vm.synced_folder ".", "/pi-gen-nightly", create:true, type: "nfs"
    o.vm.network :private_network, ip: "192.168.55.55"
    o.vm.provision :shell, :path => "setup.sh", args: ENV['SHELL_ARGS']

    o.disksize.size = '50GB'

end
