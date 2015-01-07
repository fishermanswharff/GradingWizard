class CreatePullRequests < ActiveRecord::Migration
  def change
    create_table :pull_requests do |t|
      t.integer :unique_id
      t.string :name
      t.integer :build_status
      t.string :status_message
      t.string :build_url
      t.string :commit_message
      t.integer :pull_request_number
      
      t.timestamps
    end
  end
end
