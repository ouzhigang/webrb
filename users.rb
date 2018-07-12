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
