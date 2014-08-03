require 'net/http'

namespace :ping do
	desc 'Ping dyno'
	task :start do
	  puts 'Making attempt to ping Dyno'

		if ENV['URL']
			puts 'Sending Ping'

			uri = URI(ENV['URL'])
			Net::HTTP.get_response(uri)

			puts 'Success...'
		end
	end
end
