require 'sinatra'
require 'sinatra/reloader'

TODOS = []

class Todo
	attr_accessor :text, :done, :important

	def to_s
		self.text
	end
end

get '/' do 
	erb(:todos, locals: {todos: TODOS })
end

get '/important' do
	TODOS[params[:todo].to_i].important = true
	redirect '/'
end

get '/done' do
	TODOS[params[:todo].to_i].done = true
	redirect '/'
end

post '/add' do
	t = Todo.new
	t.text = params[:todo]
	t.done = false
	t.important = false

	TODOS << t
	redirect '/'
end

get '/delete' do
	TODOS.delete_at(params[:todo].to_i)
	redirect '/'
end








