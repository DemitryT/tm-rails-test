ActiveAdmin.register MobileCampaignVersion, as: "Audit Trail For Platform Changes" do
  config.sort_order = "created_at_desc"
  actions :all, :except => [:new]

  index do
    column :campaign_name
    column "Action Performed" do |mcv|
      mcv.event == "create" ? "Added" : "Removed"
    end
    column "Mobile Platform" do |mcv|
      MobilePlatform.find(mcv.mobile_platform_id).name
    end
    column "Change made by", :whodunnit
    column "Date of change", :created_at
  end

  filter :campaign_name
end
