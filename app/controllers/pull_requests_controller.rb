class PullRequestsController < ApplicationController

  def index
    @pull_requests = PullRequest.order(:name)
  end

  def show

  end

  def create
  end

  def update
  end

  def destroy
  end
end