# munin plugins for varnish
class varnish::munin {
  $aspects = ['varnish_expunge',
    'varnish_transfer_rates',
    'varnish_objects',
    'varnish_uptime',
    'varnish_request_rate',
    'varnish_memory_usage',
    'varnish_hit_rate',
    'varnish_threads',
    'varnish_backend_traffic' ]

  if versioncmp($operatingsystemmajrelease,'7') >= 0 {
    munin::plugin::deploy{
      'varnish4_':
        source   => 'varnish/munin/varnish4_',
        register => false,
    } -> munin::plugin{
      $aspects:
        ensure => 'varnish4_',
        config => 'group varnish',
    }
  } else {
    munin::plugin{
      $aspects:
        ensure => 'varnish_',
    }
  }
}
