# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require 'json'

options "*" do
  response.headers["Allow"] = "HEAD,GET,PUT,DELETE,OPTIONS"

  # Needed for AngularJS
  response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
  response.headers["Access-Control-Allow-Origin"] = "*"

  halt HTTP_STATUS_OK
end

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

get "/items" do
	Item.all.to_json
end

get "/itemvote/:id" do
	ItemVote.where(:item_id => params['id']).first.to_json
end

get "/itemcomment/:id" do
	ItemComment.where(:item_id => params['id']).first.to_json
end

get "/uservotes/:id" do
	UserVote.where(:user_id => params['id']).to_json
end

get "/order/:id" do
	OrderItem.where(:id => params['id']).to_json
end

get "/orders" do
	Order.all.to_json
end

get "/category/:name" do
	Category.where(:name => params['name']).to_json
end

get "/allcategories" do
	categoryList = Array.new
	categories = Category.all
	categories.each do |category|
		topItem = Item.where(:category_id => category["id"]).order("item_total_votes DESC").first;
		categoryObj = {:category => category, :topItem => topItem}
		categoryList.push(categoryObj)
	end
	returnmessage = categoryList.to_json
end


post "/user" do
	payload = JSON.parse(request.body.read)
	User.create(name: payload["name"], role: payload["role"], number_of_votes: payload["number_of_votes"])
	returnmessage = 'success'
end

post "/item" do
	payload = JSON.parse(request.body.read)
	Item.create(category_id: payload["category_id"], name: payload["name"], description: payload["description"], picture: payload["picture"], status: payload["status"])
	returnmessage = 'success'
end

post "/itemvote" do
	payload = JSON.parse(request.body.read)
	ItemVote.create(item_id: payload["item_id"], vote_count: payload["vote_count"])
	returnmessage = 'success'
end

post "/itemcomment" do
	payload = JSON.parse(request.body.read)
	ItemComment.create(item_id: payload["name"], comment: payload["comment"])
	returnmessage = 'success'
end

post "/uservote" do
	payload = JSON.parse(request.body.read)
	UserVote.create(item_id: payload["item_id"], user_id: payload["user_id"], number_of_votes: payload["number_of_votes"])
	returnmessage = 'success'
end

post "/order" do
	payload = JSON.parse(request.body.read)
	Order.create(order_type: payload["order_type"], name: payload["name"], price: payload["price"], date: payload["date"])
	returnmessage = 'success'
end

post "/category" do
	payload = JSON.parse(request.body.read)
	Category.create(name: payload["name"])
	returnmessage = 'success'
end

post "/orderitem" do
	payload = JSON.parse(request.body.read)
	OrderItem.create(order_id: payload["order_id"], item_id: payload["item_id"], date: payload["date"])
	returnmessage = 'success'
end

put "/user/:id" do
	user = User.find(params['id'])
	payload = JSON.parse(request.body.read)
	unless payload["name"].nil?
		user.update(name: payload["name"])
	end
	unless payload["role"].nil?
		user.update(role: payload["role"])
	end
	unless payload["number_of_votes"].nil?
		user.update(number_of_votes: payload["number_of_votes"])
	end
	returnmessage = 'success'
end

put "/item/:id" do
	item = Item.find(params['id'])
	payload = JSON.parse(request.body.read)
	unless payload["category_id"].nil?
		item.update(category_id: payload["category_id"])
	end
	unless payload["name"].nil?
		item.update(name: payload["name"])
	end
	unless payload["description"].nil?
		item.update(description: payload["description"])
	end
	unless payload["picture"].nil?
		item.update(picture: payload["picture"])
	end
	unless payload["status"].nil?
		item.update(status: payload["status"])
	end
	returnmessage = 'success'
end

put "/itemvote/:id" do
	itemVote = ItemVote.find(params['id'])
	payload = JSON.parse(request.body.read)
	unless payload["item_id"].nil?
		itemVote.update(item_id: payload["item_id"])
	end
	unless payload["vote_count"].nil?
		itemVote.update(vote_count: payload["vote_count"])
	end
	returnmessage = 'success'
end

put "/itemcomment/:id" do
	itemComment = ItemComment.find(params['id'])
	payload = JSON.parse(request.body.read)
	unless payload["item_id"].nil?
		itemComment.update(item_id: payload["item_id"])
	end
	unless payload["comment"].nil?
		itemComment.update(comment: payload["comment"])
	end
	returnmessage = 'success'
end

put "/uservote/:id" do
	userVote = UserVote.find(params['id'])
	payload = JSON.parse(request.body.read)
	unless payload["item_id"].nil?
		userVote.update(item_id: payload["item_id"])
	end
	unless payload["user_id"].nil?
		userVote.update(user_id: payload["user_id"])
	end
	unless payload["number_of_votes"].nil?
		userVote.update(number_of_votes: payload["number_of_votes"])
	end
	returnmessage = 'success'
end

put "/orderitem/:id" do
	orderItem = OrderItem.find(params['id'])
	payload = JSON.parse(request.body.read)
	unless payload["order_item"].nil?
		orderItem.update(order_item: payload["order_item"])
	end
	unless payload["role"].nil?
		orderItem.update(role: payload["role"])
	end
	unless payload["number_of_votes"].nil?
		orderItem.update(number_of_votes: payload["number_of_votes"])
	end
	returnmessage = 'success'
end

put "/order/:id" do
	order = Order.find(params['id'])
	payload = JSON.parse(request.body.read)
	unless payload["name"].nil?
		order.update(name: payload["name"])
	end
	unless payload["order_type"].nil?
		order.update(order_type: payload["order_type"])
	end
	unless payload["price"].nil?
		order.update(price: payload["price"])
	end
	unless payload["date"].nil?
		order.update(date: payload["date"])
	end
	returnmessage = 'success'
end

put "/category/:id" do
	category = Category.find(params['id'])
	payload = JSON.parse(request.body.read)
	unless payload["name"].nil?
		category.update(name: payload["name"])
	end
	returnmessage = 'success'
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