module ReactRailsAPI
  VERSION = {
    major: 0,
    minor: 1,
    patch: 0,
    meta: nil
  }.values.reject(&:nil?).map(&:to_s)*?.
end