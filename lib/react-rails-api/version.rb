module ReactRailsAPI
  VERSION = {
    major: 0,
    minor: 1,
    patch: 2,
    meta: nil
  }.values.reject(&:nil?).map(&:to_s)*?.

  ENGINE_VERSIONS = {
    node: '^11',
    yarn: '^1.13'
  }
end