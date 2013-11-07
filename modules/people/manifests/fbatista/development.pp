class people::fbatista::development {
  file { "${people::fbatista::params::my_projects}/boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  repository { "${people::fbatista::params::my_projects}/disruption/dashboard.io":
    source => 'DisruptionCorporation/dashboard.io',
    require => File[$people::fbatista::params::my_projects]
  }

  repository { "${people::fbatista::params::my_projects}/disruption/data.dashboard.io":
    source => 'DisruptionCorporation/data.dashboard.io',
    require => File[$people::fbatista::params::my_projects]
  }

  # ------- ruby + phantomjs --------

  class { 'ruby::global':
    version => '2.0.0'
  }

  # ------- vagrant --------
  #vagrant::plugin { 'vagrant-aws': }

  class { 'nodejs::global': version => 'v0.10.13' }
}