class MobilePlatform < ActiveRecord::Base
  has_many :mobile_campaigns
  has_many :campaigns,
    through: :mobile_campaigns

  attr_accessible :name, :available

  validates :name, presence: true

end
