class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :payload
      t.references :repo, index: true
      t.timestamps
    end
  end
end
