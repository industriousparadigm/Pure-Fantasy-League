ActiveAdmin.register Manager do
  belongs_to :league
  permit_params user_attributes: [:name, :email]

  sidebar 'Additional Actions...', only: [:index, :new], priority: 0 do
    link_to 'Add myself as a Manager', add_myself_admin_league_managers_path, method: :post
  end

  index do
    selectable_column
    column :user
    column :league
    column :team
    column :created_at
    actions
  end

  # Add the current user as a manager of the league
  collection_action :add_myself, method: :post do
    @manager = build_resource
    @manager.user = current_user
    @manager.user.new_invitation = true
    @manager.not_invited = true
    @manager.invited_by = current_user
    if @manager.save
      redirect_to admin_league_managers_url, notice: t('flash.managers.myself_added.notice')
    else
      redirect_to admin_league_managers_url, alert: t('flash.managers.myself_added.alert')
    end
  end

  filter :user
  filter :league

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs for: [:user, f.object.build_user] do |user|
      user.inputs :name, :email, required: true
    end
    f.actions
  end
end
