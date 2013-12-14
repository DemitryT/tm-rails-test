class Campaign < ActiveRecord::Base
  has_many :mobile_campaigns
  has_many :mobile_platforms,
    through: :mobile_campaigns

  validates :name, presence: true
  validates :budget, numericality: { greater_than: 0 }
  validate  :has_at_least_one_platform?

  accepts_nested_attributes_for :mobile_platforms

  attr_accessible :name, :budget, :mobile_platform_ids

  def has_at_least_one_platform?
    errors.add(:base, 'A campaign must have at least one mobile platform') if self.mobile_platforms.blank?
  end

end
