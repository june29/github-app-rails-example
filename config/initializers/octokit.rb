if ENV['GITHUB_HOST'].to_s.size > 0
  Octokit.configure { |c| c.api_endpoint = "https://#{ENV['GITHUB_HOST']}/api/v3/" }
end
