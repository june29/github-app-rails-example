class Webhooks::GithubController < ApplicationController
  protect_from_forgery except: :create

  def create
    head 400 and return unless valid_request?

    render json: { message: 'dummy' }
  end

  def valid_request?
    their_signature_header = request.env['HTTP_X_HUB_SIGNATURE'] || 'sha1='
    method, their_digest = their_signature_header.split('=')

    our_digest = OpenSSL::HMAC.hexdigest(method, ENV['GITHUB_WEBHOOK_SECRET'], request.raw_post)

    their_digest == our_digest
  rescue => error
    false
  end
end
