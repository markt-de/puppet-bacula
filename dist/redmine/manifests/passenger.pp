define redmine::passenger ($db, $db_user, $db_pw, $dir, $port='80') {
  include apache::params
  include ::passenger

  $passenger_version=$passenger::params::version
  $gem_path=$passenger::params::gem_path

  redmine::instance{$name:
    db => $db,
    db_user => $db_user,
    db_pw => $db_pw, 
    user => $apache::params::user, 
    group => $apache::params::group, 
    dir => $dir,
  }
  apache::vhost{$name:
    port     => $port,
    priority => '30',
    docroot  => "${dir}/${name}/public/",
    template => 'redmine/redmine-passenger.conf.erb',
  }
  file{"${dir}/${name}/config/environment.rb":
    owner   => $apache::params::user,
    group   => $apache::params::group,
    require => Redmine::Instance[$name],
  }
}