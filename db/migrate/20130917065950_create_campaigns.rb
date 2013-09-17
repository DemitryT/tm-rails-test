class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.integer :budget
      t.timestamps
    end
  end
end
