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

  include zsh
  include prezto

  include sequel_pro
  include mysql
  include java
  include elasticsearch
  include redis

  $my = "/Users/${::boxen_user}"
  $projects = "${my}/Projects"

  file { $projects:
    ensure => directory
  }

  file { "${projects}/boxen":
    ensure => link,
    target => $boxen::config::repodir
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