# download and install simple varnish config file
define varnish::config_file(
  $source  = [
    "puppet:///modules/site_varnish/config/${::fqdn}/${name}.vcl",
    "puppet:///modules/site_varnish/config/${name}.vcl" ],
){
  file{
    "/etc/varnish/${name}.vcl":
      source  => $source,
      require => Package['varnish'],
      notify  => Exec['varnish_reload_vcl'],
      before  => Service['varnish'],
      owner   => root,
      group   => 0,
      mode    => '0640';
  }
}
