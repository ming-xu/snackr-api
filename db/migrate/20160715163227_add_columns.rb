class AddColumns < ActiveRecord::Migration
  def change
  	add_column :user_votes, :user_id, :integer
  	add_column :order_items, :order_id, :integer
  end
end
