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
    version => '2.0.0-p247'
  }

  $dashboard_ruby = "1.9.3-p385"
  $dashboard_pro_ruby = "2.0.0-p247"

  ruby::local { "${people::fredoliveira::params::my_projects}/dashboard":
    version => $dashboard_ruby
  }

  ruby::local { "${people::fredoliveira::params::my_projects}/dashboardpro":
    version => $dashboard_pro_ruby
  }

  phantomjs::local { "${people::fredoliveira::params::my_projects}/dashboard":
    version => '1.9.0'
  }

  # ------- vagrant --------

  vagrant::plugin { 'vagrant-aws': }
}