module RepoGetter
  require 'net/http'
  class Get
    def self.get_repos(base_uri,header)
      url = URI.parse(base_uri)
      http = Net::HTTP.new(url.host, 443) # set to 80 if not using HTTPS
      http.use_ssl = true # ignore if not using HTTPS
      resp, data = http.get(url.to_s, header)
    end
  end
end