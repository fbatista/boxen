class people::fbatista::system {
  include osx::global::disable_key_press_and_hold
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::finder::unhide_library
  include osx::no_network_dsstores

  # amount of time (in ms) before a key starts repeating
  class { 'osx::global::key_repeat_delay':
    delay => 10
  }

  # amount of time (in ms) before key repeat 'presses'
  class { 'osx::global::key_repeat_rate':
    rate => 2
  }

  property_list_key { 'Disable Gatekeeper':
    ensure => present,
    path   => '/var/db/SystemPolicy-prefs.plist',
    key    => 'enabled',
    value  => 'no',
  }

  boxen::osx_defaults { 'Disable Dashboard':
    key    => 'mcx-disabled',
    domain => 'com.apple.dashboard',
    value  => 'YES',
    user   => "${::luser}",
  }

  # ------- dotfiles ------

  repository { $people::fbatista::params::my_dotfiles:
    source => 'fbatista/dotfiles',
    require => File[$people::fbatista::params::my_projects]
  }

  file { "${people::fbatista::params::my_homedir}/.zprezto/runcoms/zshrc":
    ensure  => link,
    target  => "${people::fbatista::params::my_dotfiles}/.zshrc",
    require => Repository[$people::fbatista::params::my_dotfiles]
  }

  file { "${people::fbatista::params::my_homedir}/.zprezto/runcoms/zpreztorc":
    ensure  => link,
    target  => "${people::fbatista::params::my_dotfiles}/.zpreztorc",
    require => Repository[$people::fbatista::params::my_dotfiles]
  }

  file { "${people::fbatista::params::my_homedir}/Library/Preferences/com.googlecode.iterm2.plist":
    ensure  => link,
    target  => "${people::fbatista::params::my_dotfiles}/app_preferences/com.googlecode.iterm2.plist",
    require => Repository[$people::fbatista::params::my_dotfiles]
  }

  # ------- git --------

  git::config::global{ 'user.name':
    value => 'Fábio Batista',
  }

  git::config::global { 'alias.lg':
    value => "log --pretty=format:'%C(yellow)%h%C(reset) %s %C(cyan)%cr%C(reset) %C(blue)%an%C(reset) %C(green)%d%C(reset)' --graph --date-order",  }

  git::config::global { 'alias.review':
    value => 'log -p --reverse -M -C -C --patience --no-prefix',
  }

  git::config::global{ 'user.email':
    value => 'fbatista@gmail.com',
  }

  git::config::global{ 'color.ui':
    value => 'auto',
  }

  git::config::global { 'alias.ll':
    value => 'log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --numstat',
  }

  git::config::global { 'alias.dlc':
    value => 'diff --cached HEAD^',
  }

  git::config::global { 'alias.st':
    value => 'status',
  }

  git::config::global { 'alias.co':
    value => 'checkout',
  }  

  git::config::global { 'alias.ci':
    value => 'commit',
  }

  git::config::global { 'alias.br':
    value => 'branch',
  }

  git::config::global { 'alias.llog':
    value => 'log --date=local',
  }
}