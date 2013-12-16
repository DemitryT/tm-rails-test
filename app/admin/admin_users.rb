ActiveAdmin.register AdminUser do
  actions :all, :except => [:new]

  index do
    column :email
    column :role do |au|
      au.role.humanize
    end
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
  end

  filter :email
end
