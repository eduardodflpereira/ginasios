require 'net/http'
require 'uri'		

class ExternalRequestsHandler
	def self.request(url, payload)
		uri = URI(url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Post.new(url)
		request["content-type"] = 'application/x-www-form-urlencoded'
		request["cache-control"] = 'no-cache'
		request.body = payload + '&password=e94b10f0da8d42095ca5c20927416de5'

		response = http.request(request)
	end
end