class AddCampaignIdAndCampaignNameAndMobilePlatformIdToMobileCampaignVersions < ActiveRecord::Migration
  def change
    add_column :mobile_campaign_versions, :campaign_id, :integer
    add_column :mobile_campaign_versions, :campaign_name, :string
    add_column :mobile_campaign_versions, :mobile_platform_id, :integer
  end
end
