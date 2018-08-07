Rails.application.routes.draw do
  namespace :webhooks do
    post '/github', to: 'github#create'
  end
end
