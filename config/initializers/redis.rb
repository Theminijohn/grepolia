uri = URI.parse(URI.encode(ENV["REDISTOGO_URL"].strip))
REDIS = Redis.new(:url => ENV['REDISTOGO_URL'])