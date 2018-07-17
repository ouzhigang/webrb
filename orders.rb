require 'sinatra'
require 'json'
require 'erb'
require './commons'

before '/orders/' do
	puts "orders开始"
end

after '/orders/' do
	puts "orders结束"
end

get '/orders/' do
	session[:name] = "admin"
	puts session[:name]
	
	erb :orders_index, :locals => { :name => session[:name], :add_val => add(11, 12) }
end

get '/json' do
	d = {
		:a => 'A',
		:b => 'B',
		:c => 'C'
	}
	
	content_type :json
	d.to_json
end

get '/img' do
	send_file File.dirname(__FILE__) + '/static/1.png', :type => :png
end

get '/custom' do
	status 418
	headers \
		"Content-Type" => "text/html"
    body "I'm a tea pot!"
end

get '/download' do	
	attachment "test.txt"
	"store it!"	
end

get '/' do	
	erb :index
end
