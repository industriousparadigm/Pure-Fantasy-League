ActiveAdmin.register Player do
  permit_params :first_name, :last_name, :position, :club_id

  index do
    selectable_column
    column 'First Name' do |player|
      link_to player.first_name, [:admin, player]
    end
    column 'Last Name' do |player|
      link_to player.last_name, [:admin, player]
    end
    column :position
    column :club
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :first_name, required: true
      f.input :last_name, required: true
      f.input :club, required: true
      f.input :position, as: :select, collection: Position.list, required: true
    end
    f.actions
  end

  filter :first_name_or_last_name, as: :string, label: 'Name'
  filter :club
  filter :position, as: :select, collection: -> { Position.list }
end
