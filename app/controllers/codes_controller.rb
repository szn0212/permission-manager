class CodesController < ApplicationController
  def index
    redirect_to action: :setup_username
  end

  def setup_username
  end

  def setup_repositories
    username = params[:github_username]
    @repos = Octokit.repositories username
  end
end

Octokit.configure do |c|
  c.client_id = '5975112435ef3b7799be'
  c.client_secret = '783e54a4b293659a27c61515edee8a38fa5840a8'
end
