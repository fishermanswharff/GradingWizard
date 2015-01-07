class RouterController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  
  def nomnom
    if not valid_request?
      puts "Invalid payload request for repository #{repo_slug}"
    else
      payload = JSON.parse(params[:payload])
      url = "https://github.com/" + repo_slug

      # if payload['type'] == 'push' && Repo.where(name: env['HTTP_TRAVIS_REPO_SLUG'])[0] == nil 
      #   Repo.create!({name: env['HTTP_TRAVIS_REPO_SLUG'], url: payload['repository']['url']})
      # end
      # payload['type'] == 'push' #=> this is a push on the root repository
      # payload['type'] == 'pull_request' #=> this is a forked pull request
      # Repo.create!({name: env['HTTP_TRAVIS_REPO_SLUG'], url: payload['repository']['url']})
      puts "Received valid payload for repository #{repo_slug}"
    end
  end

  private
  def valid_request?
    digest = Digest::SHA2.new.update("#{env['HTTP_TRAVIS_REPO_SLUG']}#{ENV['TRAVIS_CI_TOKEN']}")
    digest.to_s == authorization
  end

  def authorization
    env['HTTP_AUTHORIZATION']
  end

  def repo_slug
    env['HTTP_TRAVIS_REPO_SLUG']
  end
end