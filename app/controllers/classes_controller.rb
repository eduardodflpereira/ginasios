class ClassesController < ApplicationController
	def register
		payload = 'aid=' + params['aid'] + '&id=' + params['id']
		time = Time.parse(params['time'])
		response = ScheduleWorker.perform_at(time - 10.hour, payload)
		render json: response
	end
end
