class PullRequest < ActiveRecord::Base
  validates :unique_id, :name, presence: true
end