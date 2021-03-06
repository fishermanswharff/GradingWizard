require Rails.root.join('lib/modules/RepoGetter')
class ReposController < ApplicationController

  def index
    @repos = Repo.get_repos
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
