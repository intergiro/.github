require 'json'

jsonString = ARGV[0]
data = JSON.parse(jsonString)
File.open("Fastlane/gc_keys.json", "w") { |f| f.puts data.to_json }
