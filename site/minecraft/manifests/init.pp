class minecraft (
  $url = 'https://piston-data.mojang.com/v1/objects/15c777e2cfe0556eef19aab534b186c0c6f277e1/server.jar',
  $install_dir = 'opt/minecraft'
  ){
  file {'/opt/minecraft':
    ensure => directory
  }
  file {"${install_dir}/server.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }
  package {'java':
    ensure => present,
  }
  file {"${install_dir}/eula.txt":
    ensure => file,
    content => 'eula=true'
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    content => epp('minecraft/minecraft.service',{
      install_dir => $install_dir
    })
  }
  service{'minecraft':
    ensure => running,
    enable => true,
    require => [Package['java'], File["${install_dir}/eula.txt"], File['/etc/systemd/system/minecraft.service']],
  }
}
