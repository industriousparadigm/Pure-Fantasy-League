ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    column :email
    column :admin
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :admin

  form do |f|
    f.inputs do
      f.input :admin
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
