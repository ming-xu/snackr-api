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
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	User.all.to_json
end

get "/user/:id" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	User.where(:id => params['id']).first.to_json
end

get "/userbyname/:name" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	User.where(:name => params['name']).first.to_json
end

get "/item/:id" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	Item.where(:id => params['id']).first.to_json
end

get "/itembyname/:name" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	Item.where(:name => params['name']).first.to_json
end

get "/items" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	Item.all.to_json
end

get "/top5items" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	Item.all.order("item_total_votes desc").to_json
end

get "/itemvote/:id" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	ItemVote.where(:item_id => params['id']).first.to_json
end

get "/itemcomment/:id" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	ItemComment.where(:item_id => params['id']).first.to_json
end

get "/uservotes/:id" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	UserVote.where(:user_id => params['id']).to_json
end

get "/order/:id" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	OrderItem.where(:id => params['id']).to_json
end

get "/orders" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	Order.all.to_json
end

get "/category/:name" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	Category.where(:name => params['name']).to_json
end

get "/itemsbycategory/:name" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	category = Category.where(:name => params['name'])
	p category
	if (category != nil)
	Item.where(:category_id => category.first['id']).to_json 
	end
end

get "/allcategories" do

	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	categoryList = Array.new
	categories = Category.all
	categories.each do |category|
		topItem = Item.where(:category_id => category["id"]).order("item_total_votes DESC").first;
		categoryObj = {:category => category, :topItem => topItem}
		categoryList.push(categoryObj)
	end
	returnmessage = categoryList.to_json
end


post "/postuser" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'
	payload = JSON.parse(request.body.read)
	User.create(name: payload["name"], role: payload["role"], number_of_up_votes: payload["number_of_up_votes"], number_of_down_votes: payload["number_of_down_votes"])
	returnmessage = 'success'
end

post "/item" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	payload = JSON.parse(request.body.read)
	Item.create(category_id: payload["category_id"], name: payload["name"], description: payload["description"], picture: payload["picture"], status: payload["status"], item_up_votes: payload["item_up_votes"], item_down_votes: payload["item_down_votes"], item_total_votes: payload["item_total_votes"],)
	returnmessage = 'success'
end

post "/itemvote" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	payload = JSON.parse(request.body.read)
	ItemVote.create(item_id: payload["item_id"], vote_count: payload["vote_count"])
	returnmessage = 'success'
end

post "/itemcomment" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	payload = JSON.parse(request.body.read)
	ItemComment.create(item_id: payload["name"], comment: payload["comment"])
	returnmessage = 'success'
end

post "/uservote" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	payload = JSON.parse(request.body.read)
	UserVote.create(item_id: payload["item_id"], user_id: payload["user_id"], number_of_up_votes: payload["number_of_up_votes"], number_of_down_votes: payload["number_of_down_votes"])
	returnmessage = 'success'
end

post "/order" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	payload = JSON.parse(request.body.read)
	Order.create(order_type: payload["order_type"], name: payload["name"], price: payload["price"], date: payload["date"])
	returnmessage = 'success'
end

post "/category" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	payload = JSON.parse(request.body.read)
	Category.create(name: payload["name"], special: payload["special"], singular_name: payload["singular_name"], icon: payload["icon"])
	returnmessage = 'success'
end

post "/orderitem" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	payload = JSON.parse(request.body.read)
	OrderItem.create(order_id: payload["order_id"], item_id: payload["item_id"], date: payload["date"])
	returnmessage = 'success'
end

put "/user/:id" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	user = User.find(params['id'])
	payload = JSON.parse(request.body.read)
	unless payload["name"].nil?
		user.update(name: payload["name"])
	end
	unless payload["role"].nil?
		user.update(role: payload["role"])
	end
	unless payload["number_of_up_votes"].nil?
		user.update(number_of_up_votes: payload["number_of_up_votes"])
	end
	unless payload["number_of_down_votes"].nil?
		user.update(number_of_down_votes: payload["number_of_down_votes"])
	end
	returnmessage = 'success'
end

post "/itemupdate/:id" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

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
	if !payload["item_up_votes"].nil? && payload["item_total_votes"].nil?
		item.update(item_up_votes: payload["item_up_votes"])
		total = payload["item_up_votes"] - item["item_down_votes"]
		item.update(item_total_votes: total)
	end
	if !payload["item_up_votes"].nil? && !payload["item_total_votes"].nil?
		item.update(item_up_votes: payload["item_up_votes"])
	end
	if !payload["item_down_votes"].nil? && payload["item_total_votes"].nil?
		item.update(item_down_votes: payload["item_down_votes"])
		total = item["item_up_votes"] - payload["item_down_votes"]
		item.update(item_total_votes: total)
	end
	if !payload["item_down_votes"].nil? && !payload["item_total_votes"].nil?
		item.update(item_down_votes: payload["item_down_votes"])
	end
	unless payload["item_total_votes"].nil?
		item.update(item_total_votes: payload["item_total_votes"])
	end
	returnmessage = 'success'
end

put "/item/:id" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

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
	if !payload["item_up_votes"].nil? && payload["item_total_votes"].nil?
		item.update(item_up_votes: payload["item_up_votes"])
		total = payload["item_up_votes"] - item["item_down_votes"]
		item.update(item_total_votes: total)
	end
	if !payload["item_up_votes"].nil? && !payload["item_total_votes"].nil?
		item.update(item_up_votes: payload["item_up_votes"])
	end
	if !payload["item_down_votes"].nil? && payload["item_total_votes"].nil?
		item.update(item_down_votes: payload["item_down_votes"])
		total = item["item_up_votes"] - payload["item_down_votes"]
		item.update(item_total_votes: total)
	end
	if !payload["item_down_votes"].nil? && !payload["item_total_votes"].nil?
		item.update(item_down_votes: payload["item_down_votes"])
	end
	unless payload["item_total_votes"].nil?
		item.update(item_total_votes: payload["item_total_votes"])
	end
	returnmessage = 'success'
end

put "/itemvote/:id" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

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
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

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
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	userVote = UserVote.find(params['id'])
	payload = JSON.parse(request.body.read)
	unless payload["item_id"].nil?
		userVote.update(item_id: payload["item_id"])
	end
	unless payload["user_id"].nil?
		userVote.update(user_id: payload["user_id"])
	end
	unless payload["number_of_up_votes"].nil?
		userVote.update(number_of_up_votes: payload["number_of_up_votes"])
	end
	unless payload["number_of_down_votes"].nil?
		userVote.update(number_of_down_votes: payload["number_of_down_votes"])
	end
	returnmessage = 'success'
end

put "/orderitem/:id" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	orderItem = OrderItem.find(params['id'])
	payload = JSON.parse(request.body.read)
	unless payload["order_id"].nil?
		orderItem.update(order_id: payload["order_id"])
	end
	unless payload["date"].nil?
		orderItem.update(date: payload["date"])
	end
	unless payload["item_id"].nil?
		orderItem.update(item_id: payload["item_id"])
	end
	returnmessage = 'success'
end

put "/order/:id" do
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

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
	headers 'Access-Control-Allow-Origin' => 'http://localhost:8015'
	headers 'Access-Control-Allow-Headers' => 'Authorization,Accepts,Content-Type,X-CSRF-Token,X-Requested-With'
	headers 'Access-Control-Allow-Methods' => 'GET,POST,PUT,DELETE,OPTIONS'
	headers 'Access-Control-Allow-Credentials' => 'true'

	category = Category.find(params['id'])
	payload = JSON.parse(request.body.read)
	unless payload["name"].nil?
		category.update(name: payload["name"])
	end
	unless payload["special"].nil?
		category.update(special: payload["special"])
	end
	unless payload["singular_name"].nil?
		category.update(singular_name: payload["singular_name"])
	end
	unless payload["icon"].nil?
		category.update(icon: payload["icon"])
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