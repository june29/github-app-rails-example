class Webhooks::GithubController < ApplicationController
  protect_from_forgery except: :create

  def create
    render json: { message: 'dummy' }
  end
end
