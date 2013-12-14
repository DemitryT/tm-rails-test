ActiveAdmin.register AdminUser do
  index do
    column :email
    column :role
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :role, label: 'Role', as: :select, collection: AdminUser::ROLES.map{|u| [u, u]}
    end
    f.actions
  end
end
