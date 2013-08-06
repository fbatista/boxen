class people::fredoliveira {
  include iterm2::dev

  include chrome
  include skype
  include onepassword
  include transmit
  include dropbox
  include textexpander
  include droplr
  include hipchat
  include sublime_text_3
  include source_code_pro
  include notational_velocity::nvalt
  include vlc

  include zsh
  include prezto

  include gitx::dev
  include sequel_pro
  include mysql
  include redis
  include java
  include elasticsearch
  include phantomjs

  package {
    [
      'git-flow'
    ]:
  }

  $my = "/Users/${::boxen_user}"

  # ------- projects folder ------

  $projects = "${my}/Projects"

  file { $projects:
    ensure => directory
  }

  file { "${projects}/boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  repository { "${projects}/dashboard":
    source => 'DisruptionCorporation/dashboard.io',
    require => File[$projects]
  }

  # ------- ruby + phantomjs --------

  class { 'ruby::global':
    version => '1.9.3-p385'
  }

  $dashboard_ruby = "1.9.3-p385"

  ruby::local { "${projects}/dashboard":
    version => $dashboard_ruby
  }

  phantomjs::local { "${projects}/dashboard":
    version => '1.9.0'
  }

  # ------- git --------

  git::config::global{ 'user.name':
    value => 'Fred Oliveira',
  }

  git::config::global { 'alias.lg':
    value => "log --pretty=format:'%C(yellow)%h%C(reset) %s %C(cyan)%cr%C(reset) %C(blue)%an%C(reset) %C(green)%d%C(reset)' --graph --date-order",  }

  git::config::global { 'alias.review':
    value => 'log -p --reverse -M -C -C --patience --no-prefix',
  }

  git::config::global{ 'user.email':
    value => 'fred@helloform.com',
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

  # ------- osx setup ------  

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

  $dotfiles = "${projects}/dotfiles"

  repository { $dotfiles:
    source => 'fredoliveira/dotfiles',
    require => File[$projects]
  }

  file { "${my}/.zprezto/runcoms/zpreztorc":
    ensure  => link,
    target  => "${dotfiles}/.zpreztorc",
    require => Repository[$dotfiles]
  }

  file { "${my}/.gitconfig":
    ensure  => link,
    target  => "${dotfiles}/.gitconfig",
    require => Repository[$dotfiles]
  }

  file { "${my}/Library/Preferences/com.googlecode.iterm2.plist":
    ensure  => link,
    target  => "${dotfiles}/app_preferences/com.googlecode.iterm2.plist",
    require => Repository[$dotfiles]
  }

  # ------- sublime text setup -------

  sublime_text_3::package { 'Package Control':
    source => 'wbond/sublime_package_control'
  }

  sublime_text_3::package { 'Theme - Soda':
    source => 'buymeasoda/soda-theme'
  }

  sublime_text_3::package { 'Color Schemes by carlcalderon':
    source => 'carlcalderon/sublime-color-schemes'
  }

  sublime_text_3::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

  $sublime_packages_dir = "${my}/Library/Application Support/Sublime Text 3/Packages"

  file { "${sublime_packages_dir}/User/Preferences.sublime-settings":
    ensure  => link,
    target  => "${dotfiles}/Preferences.sublime-settings",
    require => Repository[$dotfiles]
  }
}