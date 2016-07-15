class AlterNames < ActiveRecord::Migration
  def self.up
    rename_table :user, :users
    rename_table :item, :items
    rename_table :item_vote, :itemvotes
    rename_table :item_comment, :itemcomments
    rename_table :user_vote, :uservotes
    rename_table :order_item, :orderitems
    rename_table :order, :orders
    rename_table :category, :categorys
  end 
  def self.down
    rename_table :user, :users
    rename_table :item, :items
    rename_table :item_vote, :itemvotes
    rename_table :item_comment, :itemcomments
    rename_table :user_vote, :uservotes
    rename_table :order_item, :orderitems
    rename_table :order, :orders
    rename_table :category, :categorys
  end
end
