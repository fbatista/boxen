class people::fredoliveira::params {
  $my_homedir = "/Users/${::boxen_user}"
  $my_projects = $::boxen_srcdir
  $my_dotfiles = "${my_projects}/dotfiles"
}