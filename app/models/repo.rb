class Repo < ActiveRecord::Base
  validates :name, :url, presence: true
  has_many :reports
end