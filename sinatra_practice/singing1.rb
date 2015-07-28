# practice with Sinatra via Singing with Sinatra
require 'sinatra'
# This is a ROUTE
# telling sinatra that if the root URL '/' is requested,
# use the GET HTTP method to run the method
get '/' do
  "Hello, World!"
end

# If you redirect the URL to /about
# it should display the new content
get '/about' do
  "A little about me..."
end


# you can also access parameters from the URL
get '/hello/:name' do
  my_name = params[:name]
  "Hello there, #{my_name}"
end


# this route will load the form.erb file from a views/ directory
# the form will wait for you to fill in text via the get method
# afterwards, post will run with you new message
# the params hash is available to both get & post
get '/form' do
  erb :form
end

post '/form' do
  "'#{params[:message]}' = The stuff you typed in"
end


# Manipulations
get '/secret' do
  erb :secret
end

post '/secret' do
  params[:secret].upcase.reverse
end


# 404 Errors
# defining a custom one
# status 404 sets the status code of the page to 404
# halt 404, 'page not found' is a refactor
not_found do
  status 404
  'Not here bro'
end











