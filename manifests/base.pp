# basic setup of varnish
class varnish::base {

  package{'varnish':
    ensure => present,
  }

  varnish::config_file{'default':
    source  => [
      "puppet:///modules/site_varnish/config/${::fqdn}/default.vcl",
      'puppet:///modules/site_varnish/config/default.vcl',
      'puppet:///modules/varnish/config/default.vcl'
    ];
  }

  service{'varnish':
    ensure => running,
    enable => true,
  }

  exec{'varnish_reload_vcl':
    refreshonly => true,
    require     => Service['varnish'],
  }
}
