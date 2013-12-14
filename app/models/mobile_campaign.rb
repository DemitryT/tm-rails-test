class MobileCampaign < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :mobile_platform
end
