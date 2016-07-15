# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


class User < ActiveRecord::Base
end

class Item < ActiveRecord::Base
end

class ItemVote < ActiveRecord::Base
end

class ItemComment < ActiveRecord::Base
end

class UserVote < ActiveRecord::Base
end

class OrderItem < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

class Category < ActiveRecord::Base
end

get "/users" do
	User.all.to_json
end

get "/user/:id" do
	User.where(:id => params['id']).first.to_json
end

get "/item/:id" do
	Item.where(:id => params['id']).first.to_json
end

get "/itemvote/:id" do
	ItemVote.where(:item_id => params['id']).first.to_json
end

get "/itemcomment/:id" do
	ItemComment.where(:item_id => params['id']).first.to_json
end

get "/uservote/:id" do
	UserVote.where(:user_id => params['id']).to_json
end

get "/order/:id" do
	OrderItem.where(:id => params['id']).to_json
end

get "/category/:name" do
	Category.where(:name => params['name']).to_json
end

helpers do
  def title
    if @title
      "#{@title}"
    else
      "Welcome."
    end
  end
end