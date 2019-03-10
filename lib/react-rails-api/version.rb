module ReactRailsAPI
  VERSION = {
    major: 0,
    minor: 1,
    patch: 1,
    meta: nil
  }.values.reject(&:nil?).map(&:to_s)*?.
end