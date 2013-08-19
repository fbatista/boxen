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
    version => '2.0.0'
  }

  # ------- vagrant --------

  vagrant::plugin { 'vagrant-aws': }
}