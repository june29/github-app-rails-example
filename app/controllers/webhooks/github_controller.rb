class Webhooks::GithubController < ApplicationController
  protect_from_forgery except: :create

  def create
    head 400 and return unless valid_request?

    if request.env['HTTP_X_GITHUB_EVENT'] == 'pull_request'
      installation_id = params[:installation][:id]
      repo = params[:repository][:full_name]
      number = params[:number]
      comment = 'This is a comment from GitHub App!'

      github_client_for(installation_id).add_comment(repo, number, comment)
    end

    head 200
  end

  def valid_request?
    their_signature_header = request.env['HTTP_X_HUB_SIGNATURE'] || 'sha1='
    method, their_digest = their_signature_header.split('=')

    our_digest = OpenSSL::HMAC.hexdigest(method, ENV['GITHUB_WEBHOOK_SECRET'], request.raw_post)

    their_digest == our_digest
  rescue => error
    false
  end

  def github_client_for(installation_id)
    current = Time.current.to_i

    key = {
      iat: current,
      exp: current + (10 * 60),
      iss: ENV['GITHUB_APP_IDENTIFIER']
    }
    jwt = JWT.encode(key, github_app_private_key, 'RS256')

    bearer_client = Octokit::Client.new(bearer_token: jwt)
    access_token = bearer_client.create_app_installation_access_token(installation_id)[:token]

    Octokit::Client.new(access_token: access_token)
  end

  def github_app_private_key
    @github_app_private_key ||= OpenSSL::PKey::RSA.new(File.read(Rails.root.join('github-app.pem')))
  end
end
