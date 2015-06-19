ActiveAdmin.register Team do
  belongs_to :league
  permit_params :title

  index do
    selectable_column
    column 'Title' do |team|
      link_to team, [:admin, league, team]
    end
    column :manager
    column :league
    column :created_at
    actions
  end

  filter :title
  filter :manager
  filter :league
end
