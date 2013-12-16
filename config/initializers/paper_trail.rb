module PaperTrail
  class Version < ActiveRecord::Base
    attr_accessible :campaign_id, :campaign_name, :mobile_platform_id
  end
end
