require Rails.root.join('lib/modules/RepoGetter')
class ReposController < ApplicationController

  def index
    Rails.cache.fetch([:ga_repos,self], expires_in: 5.minutes) do
      client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
      @repos = client.repos('ga-wdi-boston', :per_page => 100)
      last_response = client.last_response
      number_of_pages = last_response.rels[:last].href.match(/page=(\d+)$/)[1]
    end
  end

  def create
    @repo = Repo.new(repos_params)
    if @repo.save
      redirect_to @repo
    else
      redirect_to root_path
      flash[:alert] = "#{@repo.errors.full_messages[0]}"
    end
  end

  def repos_params
    params.require(:repo).permit(:name, :url)
  end
end