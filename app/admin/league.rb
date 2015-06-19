ActiveAdmin.register League do
  permit_params :title, :auction_on

  scope "Current Season - #{Season.new}", :current_season, default: true

  sidebar "Project Details", only: [:show, :edit] do
    ul do
      li link_to "Managers", admin_league_managers_path(league)
      li link_to "Teams", admin_league_teams_path(league)
    end
  end

  index do
    selectable_column
    column 'Title' do |league|
      link_to league, [:admin, league]
    end
    column :season
    column :auction_on
    actions
  end

  filter :title
  filter :season, as: :select, collection: -> { Season.list }
  filter :auction_on

  form do |f|
    f.inputs do
      f.input :title
      f.input :auction_on
    end
    f.actions
  end
end
