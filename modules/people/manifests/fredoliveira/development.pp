class people::fredoliveira::development {
  file { $people::fredoliveira::params::my_projects:
    ensure => directory
  }

  file { "${people::fredoliveira::params::my_projects}/boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  repository { "${people::fredoliveira::params::my_projects}/dashboard":
    source => 'DisruptionCorporation/dashboard.io',
    require => File[$people::fredoliveira::params::my_projects]
  }

  # ------- ruby + phantomjs --------

  class { 'ruby::global':
    version => '1.9.3-p385'
  }

  $dashboard_ruby = "1.9.3-p385"

  ruby::local { "${people::fredoliveira::params::my_projects}/dashboard":
    version => $dashboard_ruby
  }

  phantomjs::local { "${people::fredoliveira::params::my_projects}/dashboard":
    version => '1.9.0'
  }

  # ------- vagrant --------

  vagrant::plugin { 'vagrant-aws': }
}