class Repo < ActiveRecord::Base
  validates :name, :url, presence: true

  def self.get_repos
    Rails.cache.fetch([:ga_repos,self], expires_in: 5.minutes) do
      client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
      repos = client.repos('ga-wdi-boston', :per_page => 100)
      # last_response = client.last_response
      # number_of_pages = last_response.rels[:last].href.match(/page=(\d+)$/)[1]
    end
  end
end