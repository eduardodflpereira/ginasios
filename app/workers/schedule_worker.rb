require 'net/http'
require 'uri'		

class ScheduleWorker
  include Sidekiq::Worker

  def perform(payload)
		url = "https://www.myhut.pt/appservices/app2017janmyv1hut/aulas-marcacao-json.php"
		logger.info "Things are happening."
		50.times do
			response = ExternalRequestsHandler.request(url, payload)
			logger.info response.read_body
		end
  end
end
