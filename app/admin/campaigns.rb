ActiveAdmin.register Campaign do
  index do
    column :name
    column :budget
    column :mobile_platforms do |campaign|
      campaign.mobile_platforms.map(&:name).join(", ").html_safe
    end
    column :created_at
    default_actions
  end

  show do
    attributes_table do
      row :name
      row :budget
      row 'Mobile Platforms' do |campaign|
        campaign.mobile_platforms.map(&:name).join(", ").html_safe
      end
      row :created_at
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Campaign Details" do
      f.input :name
      f.input :budget
      f.input :mobile_platforms, as: :check_boxes
      f.actions
    end
  end
end
