class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :title
      t.references :manager
      t.references :league

      t.timestamps null: false
    end
  end
end
