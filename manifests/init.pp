# manage varnish
class varnish(
  $manage_munin   = false,
  $default_config = true,
) {

  include ::varnish::base

  if $manage_munin {
    include ::varnish::munin
  }
}
