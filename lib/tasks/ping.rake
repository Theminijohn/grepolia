require 'net/http'

namespace :ping do
	desc 'Ping dyno'
	task :start do
	  puts 'Making attempt to ping Dyno'

		if ENV['URL']
			puts 'Sending Ping'
<<<<<<< HEAD

			uri = URI(ENV['URL'])
			Net::HTTP.get_response(uri)

=======
			uri = URI(ENV['URL'])
			Net::HTTP.get_response(uri)
>>>>>>> hotfix/1.0.0
			puts 'Success...'
	end
end
