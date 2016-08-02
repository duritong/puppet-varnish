# basic setup of varnish
class varnish::base {

  package{'varnish':
    ensure => present,
  } -> service{'varnish':
    require => Package['varnish'],
    ensure  => running,
    enable  => true,
  } -> exec{'varnish_reload_vcl':
    refreshonly => true,
  }

  if $varnish::default_config {
    varnish::config_file{'default':
      source  => [
        "puppet:///modules/site_varnish/config/${::fqdn}/default.vcl",
        'puppet:///modules/site_varnish/config/default.vcl',
        "puppet:///modules/varnish/config/${::operatingsystem}.${::operatingsystemmajrelease}/default.vcl",
        'puppet:///modules/varnish/config/default.vcl',
      ];
    }
  }
}
