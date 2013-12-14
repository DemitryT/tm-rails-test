class CreateMobileCampaigns < ActiveRecord::Migration
  def change
    create_table :mobile_campaigns do |t|
      t.belongs_to :campaign
      t.belongs_to :mobile_platform
      t.timestamps
    end

    add_index :mobile_campaigns, :campaign_id
    add_index :mobile_campaigns, :mobile_platform_id
  end
end
