class AddItemVoteField < ActiveRecord::Migration
  def change
  	add_column :items, :item_votes, :integer
  end
end
