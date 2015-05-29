class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.belongs_to :user, index: true
      t.belongs_to :league, index: true
      t.string :invitation_token
      t.datetime :invitation_accepted_at
      t.references :invited_by, polymorphic: true
      t.index :invitation_token, unique: true
      t.index :invited_by_id
      t.timestamps null: false
    end
  end
end
