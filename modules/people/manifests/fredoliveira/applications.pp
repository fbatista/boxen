class people::fredoliveira::applications {
  include iterm2::dev
  include zsh
  include prezto

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
  include unarchiver

  include gitx::dev
  include sequel_pro
  include mysql
  include redis
  include java
  include elasticsearch
  include phantomjs
  include virtualbox
  include vagrant

  # homebrew packages
  package {
    [
      'git-flow',
      'unrar'
    ]:
  }

  # ------- sublime text setup -------

  $sublime_installed_packages_dir = "${people::fredoliveira::params::my_homedir}/Library/Application Support/Sublime Text 3/Installed Packages"
  $sublime_packages_dir = "${people::fredoliveira::params::my_homedir}/Library/Application Support/Sublime Text 3/Packages"

  exec { "cd \"${sublime_installed_packages_dir}\" && curl -O 'https://sublime.wbond.net/Package Control.sublime-package'":
    creates  =>  "${sublime_installed_packages_dir}/Package Control.sublime-package"
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

  file { "${sublime_packages_dir}/User/Preferences.sublime-settings":
    ensure  => link,
    target  => "${people::fredoliveira::params::my_dotfiles}/Preferences.sublime-settings",
    require => Repository[$people::fredoliveira::params::my_dotfiles]
  }
}