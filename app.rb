# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


class User < ActiveRecord::Base
end

get "/users" do
  @users = User.all.order("name DESC")
  @title = "Welcome."
  erb :"users/index"
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