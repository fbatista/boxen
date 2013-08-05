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

  $dotfiles = "${projects}/dotfiles"

  repository { $dotfiles:
    source => 'fredoliveira/dotfiles',
    require => File[$projects]
  }

  #file { "${home}/.zshrc":
  #  ensure  => link,
  #  target  => "${dotfiles_dir}/.zshrc",
  #  require => Repository[$dotfiles_dir]
  #}
}