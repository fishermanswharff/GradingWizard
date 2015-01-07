class TravisController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  
  def nomnom
    if not valid_request?
      puts "Invalid payload request for repository #{repo_slug}"
    else
      payload = JSON.parse(params[:payload])
      url = "https://github.com/" + repo_slug


      binding.byebug

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

=begin
pull_request model: 
  t.integer :unique_id (payload['id'])
  t.string :name (env['HTTP_TRAVIS_REPO_SLUG'])
  t.integer :build_status (payload['status'])
  t.string :status_message (payload['status_message'])
  t.string :build_url (payload['build_url'])
  t.string :commit_message (payload['message'])
  t.integer :pull_request_number (payload['pull_request_number'])
  
{
  "id"=>46232633, 
  "repository"=>
    {
      "id"=>2228655, 
      "name"=>"wdi_1_ruby_demo_basics", 
      "owner_name"=>"ga-wdi-boston", 
      "url"=>nil
    }, 
  "number"=>"20", 
  "config"=>
    {
      "language"=>"ruby", 
      "rvm"=>["2.2.0"], 
      "script"=>"bundle exec rspec spec", 
      "notifications"=>{"webhooks"=>"http://4d126c4b.ngrok.com/travisreports"}, 
      ".result"=>"configured", 
      "os"=>"linux"
    }, 
  "status"=>1, 
  "result"=>1, 
  "status_message"=>"Broken", 
  "result_message"=>"Broken", 
  "started_at"=>"2015-01-07T19:37:30Z", 
  "finished_at"=>"2015-01-07T19:37:43Z", 
  "duration"=>13, 
  "build_url"=>"https://travis-ci.org/ga-wdi-boston/wdi_1_ruby_demo_basics/builds/46232633", 
  "commit"=>"a86c98d745c396a9d314d6491931a62fc290c5f3", 
  "branch"=>"master", 
  "message"=>"gitignore", 
  "compare_url"=>"https://github.com/ga-wdi-boston/wdi_1_ruby_demo_basics/pull/1", 
  "committed_at"=>"2015-01-07T19:35:40Z", 
  "author_name"=>"fishermanswharff", 
  "author_email"=>"fishermanswharff@github.com", 
  "committer_name"=>"fishermanswharff", 
  "committer_email"=>"fishermanswharff@github.com", 
  "matrix"=>
    [
      {
        "id"=>46232634, 
        "repository_id"=>2228655, 
        "parent_id"=>46232633, 
        "number"=>"20.1", 
        "state"=>"finished", 
        "config"=>
          {
            "language"=>"ruby", 
            "rvm"=>"2.2.0", 
            "script"=>"bundle exec rspec spec", 
            "notifications"=>
              {"webhooks"=>"http://4d126c4b.ngrok.com/travisreports"}, 
            ".result"=>"configured", 
            "os"=>"linux"
          }, 
        "status"=>1, 
        "result"=>1, 
        "commit"=>"a86c98d745c396a9d314d6491931a62fc290c5f3", 
        "branch"=>"master", 
        "message"=>"gitignore", 
        "compare_url"=>"https://github.com/ga-wdi-boston/wdi_1_ruby_demo_basics/pull/1", 
        "committed_at"=>"2015-01-07T19:35:40Z", 
        "author_name"=>"fishermanswharff", 
        "author_email"=>"fishermanswharff@github.com", 
        "committer_name"=>"fishermanswharff", 
        "committer_email"=>"fishermanswharff@github.com", 
        "finished_at"=>"2015-01-07T19:37:43Z"
      }
    ], 
  "type"=>"pull_request", 
  "pull_request_number"=>1
}







=end

