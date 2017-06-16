Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/classes/register', to: 'classes#register'

  require 'sidekiq/web'
	mount Sidekiq::Web => '/sidekiq'
end
