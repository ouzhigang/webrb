require 'sinatra'
require 'json'
require 'erb'

configure do
	puts 'config'
	
	enable :sessions
	set :public_folder, File.dirname(__FILE__) + '/static'
	set :views, File.dirname(__FILE__) + '/templates'
end

#before '/users/*' do
#	puts "users start"
#end

#after '/users/*' do
#	puts "users start"
#end
