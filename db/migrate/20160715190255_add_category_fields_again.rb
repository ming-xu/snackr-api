class AddCategoryFieldsAgain < ActiveRecord::Migration
  def change
  	add_column :categories, :special, :boolean
  	add_column :categories, :singular_name, :string
  	add_column :categories, :icon, :string
  	change_column :items, :status, 'boolean USING CAST(status AS boolean)'
  end
end
