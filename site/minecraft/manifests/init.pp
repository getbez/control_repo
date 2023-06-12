class minecraft {
  file {'/opt/minecraft':
    ensure => directory
  }
  file {'/opt/minecraft/server.jar':
    ensure => file,
    source => 'https://piston-data.mojang.com/v1/objects/15c777e2cfe0556eef19aab534b186c0c6f277e1/server.jar',
  }
  package {'java':
    ensure => present,
  }
  file {'/opt/minecraft/eula.txt':
    ensure => file,
    content => 'eula=true'
  }
  file {'/etc/system/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service'
  }
  service{'minecraft':
    ensure => running,
    enable => true,
  }
}
