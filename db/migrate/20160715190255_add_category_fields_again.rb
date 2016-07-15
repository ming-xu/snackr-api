class AddCategoryFieldsAgain < ActiveRecord::Migration
  def change
  	add_column :categories, :special, :boolean
  	add_column :categories, :singular_name, :string
  	add_column :categories, :icon, :string
  	remove_column :items, :status
  	add_column :items, :status, :boolean
  end
end
