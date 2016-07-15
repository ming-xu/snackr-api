class AddMoreFields < ActiveRecord::Migration
  def change
  	add_column :users, :number_of_down_votes, :integer
  	rename_column :users, :number_of_votes, :number_of_down_votes
  	add_column :items, :item_down_votes, :integer
  	add_column :items, :item_total_votes, :integer
  	rename_column :items, :item_votes, :item_up_votes
  	add_column :user_votes, :number_of_down_votes, :integer
  	rename_column :user_votes, :number_of_votes, :number_of_up_votes
  end
end
