class IntializeFields < ActiveRecord::Migration
  def change
  	change_column_default :items, :item_up_votes, 0
  	change_column_default :items, :item_down_votes, 0
  	change_column_default :items, :item_total_votes, 0
  	change_column_default :items, :status, false
  end
end
