# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create the initial mobile platforms
["Android", "iOS"].each do |mobile_platform|
  MobilePlatform.where(name: mobile_platform).first_or_create!
end

# Create a new campaign manager
AdminUser.create!(email: 'cm@example.com', password: 'password', password_confirmation: 'password', role: "campaign_manager")