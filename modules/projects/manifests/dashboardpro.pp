class projects::dashboardpro {
  boxen::project { 'dashboardpro':
    mysql         => true,
    nginx         => true,
    ruby          => '2.0.0-p247',
    source        => 'DisruptionCorporation/data.dashboard.io'
  }
}
