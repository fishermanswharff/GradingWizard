class Repo < ActiveRecord::Base
  validates :name, :url, presence: true
end