class MobileCampaign < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :mobile_platform

  has_paper_trail class_name: 'MobileCampaignVersion',
    if: Proc.new {|mc| mc.campaign.budget > 1000 },
    meta: {
            campaign_id: Proc.new { |mc| mc.campaign.id },
            campaign_name: Proc.new { |mc| mc.campaign.name },
            mobile_platform_id: Proc.new { |mc| mc.mobile_platform.id }
          }

end
