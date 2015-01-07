module RepoGetter
  require 'net/http'
  class Get
    def self.get_repos(base_uri)
      url = URI.parse(base_uri)
      http = Net::HTTP.new(url.host, 443) # set to 80 if not using HTTPS
      http.use_ssl = true # ignore if not using HTTPS
      resp, data = http.get(url.to_s)
    end
  end
end
=begin


{
    "id": 10252541,
    "name": "wdi_1_ruby_demo_rspec_word_count",
    "full_name": "ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count",
    "owner": {
      "login": "ga-wdi-boston",
      "id": 6361298,
      "avatar_url": "https://avatars.githubusercontent.com/u/6361298?v=3",
      "gravatar_id": "",
      "url": "https://api.github.com/users/ga-wdi-boston",
      "html_url": "https://github.com/ga-wdi-boston",
      "followers_url": "https://api.github.com/users/ga-wdi-boston/followers",
      "following_url": "https://api.github.com/users/ga-wdi-boston/following{/other_user}",
      "gists_url": "https://api.github.com/users/ga-wdi-boston/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/ga-wdi-boston/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/ga-wdi-boston/subscriptions",
      "organizations_url": "https://api.github.com/users/ga-wdi-boston/orgs",
      "repos_url": "https://api.github.com/users/ga-wdi-boston/repos",
      "events_url": "https://api.github.com/users/ga-wdi-boston/events{/privacy}",
      "received_events_url": "https://api.github.com/users/ga-wdi-boston/received_events",
      "type": "Organization",
      "site_admin": false
    },
    "private": false,
    "html_url": "https://github.com/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count",
    "description": "",
    "fork": false,
    "url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count",
    "forks_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/forks",
    "keys_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/teams",
    "hooks_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/hooks",
    "issue_events_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/issues/events{/number}",
    "events_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/events",
    "assignees_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/assignees{/user}",
    "branches_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/branches{/branch}",
    "tags_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/tags",
    "blobs_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/languages",
    "stargazers_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/stargazers",
    "contributors_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/contributors",
    "subscribers_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/subscribers",
    "subscription_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/subscription",
    "commits_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/issues/comments/{number}",
    "contents_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/contents/{+path}",
    "compare_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/merges",
    "archive_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/downloads",
    "issues_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/issues{/number}",
    "pulls_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/labels{/name}",
    "releases_url": "https://api.github.com/repos/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count/releases{/id}",
    "created_at": "2013-05-23T20:17:16Z",
    "updated_at": "2014-01-14T16:10:11Z",
    "pushed_at": "2013-06-24T20:26:53Z",
    "git_url": "git://github.com/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count.git",
    "ssh_url": "git@github.com:ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count.git",
    "clone_url": "https://github.com/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count.git",
    "svn_url": "https://github.com/ga-wdi-boston/wdi_1_ruby_demo_rspec_word_count",
    "homepage": null,
    "size": 107,
    "stargazers_count": 1,
    "watchers_count": 1,
    "language": "Ruby",
    "has_issues": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": false,
    "forks_count": 1,
    "mirror_url": null,
    "open_issues_count": 0,
    "forks": 1,
    "open_issues": 0,
    "watchers": 1,
    "default_branch": "master",
    "permissions": {
      "admin": false,
      "push": false,
      "pull": true
    }
  },

=end
