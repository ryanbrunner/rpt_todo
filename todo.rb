require 'sinatra'
require 'sinatra/reloader'

@@todos = []

get '/' do 
  erb :todos, locals: {
    todos: @@todos  
  }
end