# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.0.1"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "homebrew",   "1.4.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.2.9"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.3.0"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "java",                  "1.1.2"
github "osx",                   "1.5.0"
github "iterm2",                "1.0.3"
github "sequel_pro",            "1.0.0"
github "skype",                 "1.0.3"
github "onepassword",           "1.0.2"
github "transmit",              "1.0.1"
github "dropbox",               "1.1.1"
github "redis",                 "1.0.1", :repo => "fredoliveira/puppet-redis"
github "chrome",                "1.1.1"
github "mysql",                 "1.1.3"
github "elasticsearch",         "1.0.1"
github "zsh",                   "1.0.0"
github "hipchat",               "1.0.7"
github "textexpander",          "1.0.0"
github "droplr",                "1.0.1"
github "prezto",                "1.0.1", :repo => "archfear/puppet-prezto"
github "sublime_text_3",        "1.1.3", :repo => "fredoliveira/puppet-sublime_text_3"
github "source_code_pro",       "1.0.8", :repo => "fredoliveira/puppet-source_code_pro"
github "notational_velocity",   "1.1.1"
github "property_list_key",     "0.1.0"
github "gitx",                  "1.2.0"
github "phantomjs",             "2.0.2"
github "vlc",                   "1.0.3"