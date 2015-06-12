class AddAuctionOnToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :auction_on, :datetime
  end
end
