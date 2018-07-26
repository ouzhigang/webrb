require 'sinatra'
require 'json'
require 'erb'

before '/users/*' do
	puts "users开始"
end

after '/users/*' do
	puts "users结束"
end

#/users/list/123/456
get %r{/users/list/(\d+)/(\d+)} do |param1, param2|
	'/users/list/=====参数为:' + param1 + ',' + param2
end

#/users/view?name=admin
get %r{/users/view} do
	name = params[:name]
	if name == nil
		name = "无"
	end
	'/users/view=====参数为:' + name
end

get '/users/upload' do
	erb :users_upload
end

post '/users/do_upload' do
	
	unless params[:file1]
		return 'upload fail'
    end
	
	puts params[:file1]
	#puts params[:file1][:tempfile].read
	
	'upload success'
end
