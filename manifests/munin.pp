class varnish::munin {
  munin::plugin{
    ['varnish_expunge',
    'varnish_transfer_rates',
    'varnish_objects',
    'varnish_uptime',
    'varnish_request_rate',
    'varnish_memory_usage',
    'varnish_hit_rate',
    'varnish_threads',
    'varnish_backend_traffic' ]:
      ensure => "varnish_",
  }   
}
