# GitHub App example built with Rails

A tiny GitHub App example built with Rails.

## How to run

  1. Create your GitHub App on <a href="https://github.com/settings/apps/new" title="Register new GitHub App">Register new GitHub App</a>
    - Set `Webhook URL` to the server running this application
    - Set `Webhook secret` for security
    - Set `Read & Write` permission for `Pull requests`
  2. Create and configure `.env` file
    - Set `GITHUB_APP_IDENTIFIER` from your GitHub App
    - Set `GITHUB_WEBHOOK_SECRET` from your GitHub App
    - Set `GITHUB_HOST` optionally, if you use GitHub Enterprise
  3. Put `github-app.pem` on project root directory
    - Get from your GitHub App config page
  4. Run `rails server`

## References I read

- For GitHub
  - <a href="https://developer.github.com/apps/building-github-apps/" title="Building GitHub Apps | GitHub Developer Guide">Building GitHub Apps | GitHub Developer Guide</a>
  - <a href="https://developer.github.com/apps/building-your-first-github-app/" title="Building Your First GitHub App | GitHub Developer Guide">Building Your First GitHub App | GitHub Developer Guide</a>
  - <a href="https://github.com/github/platform-samples/tree/master/api/ruby/building-your-first-github-app" title="platform-samples/api/ruby/building-your-first-github-app at master · github/platform-samples">platform-samples/api/ruby/building-your-first-github-app at master · github/platform-samples</a>
  - <a href="https://developer.github.com/apps/building-github-apps/authenticating-with-github-apps/" title="Authenticating with GitHub Apps | GitHub Developer Guide">Authenticating with GitHub Apps | GitHub Developer Guide</a>
- For GitHub Enterprise (v2.14)
  - <a href="https://developer.github.com/enterprise/2.14/apps/building-github-apps/authenticating-with-github-apps/" title="Authenticating with GitHub Apps | GitHub Developer Guide">Authenticating with GitHub Apps | GitHub Developer Guide</a>
