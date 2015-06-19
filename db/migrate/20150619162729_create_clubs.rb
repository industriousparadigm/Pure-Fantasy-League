class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :full_name
      t.string :short_name
      t.boolean :active

      t.timestamps null: false
    end
  end
end
