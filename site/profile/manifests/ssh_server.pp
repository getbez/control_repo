class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDC6MIasrb+lY/ETyE5WhriWUMD2CvTOUzfUiJuxgONjvFJAv1Lhbl88OpUpAFg/Qu0F3awrNsHeoabCV5zLEFvq6zHb9gfQxMtTklzRrgpHx/fSf9QbJzXwNmdhPiKmiGNyYWY620PkO1Z0+mYbqaneASXDH1s8KOqvg1MkhlSZHqoTnxOTs8CkD/PzBgKYiBcXOSECk91y48gGASVgH03E7Hxwqk0aoohXt0HSabnqsTKjb1bAKUFbdGwVi6dYvdENm8bqcU2vL6NSBLelbWHwpWtPi2yRA1YteZCHfq4cozTGM21+k+Gs09YC+arKh6j5pfrc//NRni9kAWLTsip',
	}  
}
