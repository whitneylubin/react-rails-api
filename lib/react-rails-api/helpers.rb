require 'json'

# Loads a template from ./templates
def template(name)
  File.open(File.join __dir__, 'templates', name).read
end

# Allows for modification of JSON files
def modify_json(file)
  hash = JSON.parse File.read(file), symbolize_names: true
  yield hash if block_given?
  File.open(file, ?w) {|f| f.write JSON.pretty_generate(hash)}
end