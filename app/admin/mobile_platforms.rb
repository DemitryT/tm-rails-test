ActiveAdmin.register MobilePlatform do

  index do
    column :name
    column :available do |mp|
      mp.available == true ? "Yes" : "No"
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :available do |mp|
        mp.available == true ? "Yes" : "No"
      end
    end
  end
end
