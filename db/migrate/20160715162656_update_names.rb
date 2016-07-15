class UpdateNames < ActiveRecord::Migration
  def self.up
    rename_table :itemvotes, :item_votes
    rename_table :itemcomments, :item_comments
    rename_table :uservotes, :user_votes
    rename_table :orderitems, :order_items
  end 
  def self.down
    rename_table :item_vote, :item_votes
    rename_table :item_comment, :item_comments
    rename_table :user_vote, :user_votes
    rename_table :order_item, :order_items
  end
end
