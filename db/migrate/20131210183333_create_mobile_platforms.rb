class CreateMobilePlatforms < ActiveRecord::Migration
  def change
    create_table :mobile_platforms do |t|
      t.string :name, null: false
      t.boolean :available, default: true
      t.timestamps
    end
  end
end
