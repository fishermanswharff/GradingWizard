class RouterController < ApplicationController
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

When Travis CI makes the POST request, a header named Authorization is included. 
Its value is the SHA2 hash of the: 
  GitHub username (see below), fishermanswharff
  the name of the repository, wdi_1_ruby_demo_basics
  and your Travis CI token. D2uqhCzort3VBJeS15Ng 


digest = Digest::SHA2.new.update("#{env['HTTP_AUTHORIZATION']}D2uqhCzort3VBJeS15Ng")
{
  "id"=>46126320, 
  "repository"=>
    {
      "id"=>2228655, 
      "name"=>"wdi_1_ruby_demo_basics", 
      "owner_name"=>"ga-wdi-boston", 
      "url"=>nil
    }, 
  "number"=>"13", 
  "config"=>
    {
      "language"=>"ruby", 
      "rvm"=>["2.2.0"], 
      "script"=>"bundle exec rspec spec", 
      "notifications"=>
        {
          "webhooks"=>"http://5cb5b87e.ngrok.com/travisreports"
        }, 
      ".result"=>"configured", 
      "os"=>"linux"
    }, 
  "status"=>1, 
  "result"=>1, 
  "status_message"=>"Broken", 
  "result_message"=>"Broken", 
  "started_at"=>"2015-01-06T21:50:03Z", 
  "finished_at"=>"2015-01-06T21:50:15Z", 
  "duration"=>12, 
  "build_url"=>"https://travis-ci.org/ga-wdi-boston/wdi_1_ruby_demo_basics/builds/46126320", 
  "commit"=>"eadcfc598d89a229816d58b58bca0951ed33e490", 
  "branch"=>"master", 
  "message"=>"booleans spec", 
  "compare_url"=>"https://github.com/ga-wdi-boston/wdi_1_ruby_demo_basics/pull/1", 
  "committed_at"=>"2015-01-06T21:48:47Z", 
  "author_name"=>"fishermanswharff", 
  "author_email"=>"fishermanswharff@github.com", 
  "committer_name"=>"fishermanswharff", 
  "committer_email"=>"fishermanswharff@github.com", 
  "matrix"=>
    [
      {
        "id"=>46126321, 
        "repository_id"=>2228655, 
        "parent_id"=>46126320, 
        "number"=>"13.1", 
        "state"=>"finished", 
        "config"=>
          {
            "language"=>"ruby", 
            "rvm"=>"2.2.0", 
            "script"=>"bundle exec rspec spec", 
            "notifications"=>
              {
                "webhooks"=>"http://5cb5b87e.ngrok.com/travisreports"
              }, 
            ".result"=>"configured", 
            "os"=>"linux"
          }, 
        "status"=>1, 
        "result"=>1, 
        "commit"=>"eadcfc598d89a229816d58b58bca0951ed33e490", 
        "branch"=>"master", 
        "message"=>"booleans spec", 
        "compare_url"=>"https://github.com/ga-wdi-boston/wdi_1_ruby_demo_basics/pull/1", 
        "committed_at"=>"2015-01-06T21:48:47Z", 
        "author_name"=>"fishermanswharff", 
        "author_email"=>"fishermanswharff@github.com", 
        "committer_name"=>"fishermanswharff", 
        "committer_email"=>"fishermanswharff@github.com", 
        "finished_at"=>"2015-01-06T21:50:15Z"
      }
    ], 
  "type"=>"pull_request", "pull_request_number"=>1
}


=end
