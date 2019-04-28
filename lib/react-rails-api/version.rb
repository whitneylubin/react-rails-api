module ReactRailsAPI
  VERSION = {
    major: 0,
    minor: 2,
    patch: 0,
    meta: nil
  }.values.reject(&:nil?).map(&:to_s)*?.

  ENGINE_VERSIONS = {
    node: '^11',
    yarn: '^1.13'
  }
end