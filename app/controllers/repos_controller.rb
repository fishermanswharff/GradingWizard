require Rails.root.join('lib/modules/RepoGetter')
class ReposController < ApplicationController

  def index
    Rails.cache.fetch([:ga_repos,self], expires_in: 5.minutes) do
      @repos = RepoGetter::Get::get_repos('https://api.github.com/orgs/ga-wdi-boston/repos?per_page=100')
      links_string = @repos.header.fetch('link') #=> "<https://api.github.com/organizations/6361298/repos?per_page=100&page=2>; rel=\"next\", <https://api.github.com/organizations/6361298/repos?per_page=100&page=4>; rel=\"last\""
      @repos = JSON.parse(@repos.body)
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