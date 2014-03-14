require 'sinatra'
require 'sinatra/reloader'

@@todos = ["Mow the lawn", "Walk the dog"]

get '/' do 
  erb :todos, locals: {
    todo_list: @@todos  
  }
end

# http://localhost:4567/add?todo=Mow the lawn
post '/add' do
  @@todos << params[:todo]
  redirect to('/')
end

post '/remove/:i' do
  @@todos.delete_at(params[:i].to_i)
  redirect to('/')
end