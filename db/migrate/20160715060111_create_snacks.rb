class CreateSnacks < ActiveRecord::Migration
   def self.up
   create_table :user do |t|
     t.string :name
     t.string :role
     t.integer :number_of_votes
   end
   create_table :item do |t|
     t.integer :category_id
     t.string :name
     t.text :description
     t.binary :picture
     t.string :status
   end
   create_table :item_vote do |t|
     t.integer :item_id
     t.integer :vote_count
   end
   create_table :item_comment do |t|
     t.integer :item_id
     t.text :comment
   end
   create_table :user_vote do |t|
     t.integer :item_id
     t.integer :number_of_votes
     t.timestamps
   end
   create_table :order_item do |t|
   	 t.integer :item_id
     t.date :date
   end
   create_table :order do |t|
   	 t.string :type
   	 t.string :name
   	 t.decimal :price
     t.date :date
   end
   create_table :category do |t|
   	 t.string :name
   end
 end

 def self.down
   drop_table :user
   drop_table :item
   drop_table :item_vote
   drop_table :item_comment
   drop_table :user_vote
   drop_table :order_item
   drop_table :order
   drop_table :category
 end
end