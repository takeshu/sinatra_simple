require 'sinatra'
require 'sqlite3'
require 'pp'
db=SQLite3::Database.new "db/post.db"
db.results_as_hash=true

get '/' do
	posts=db.execute("SELECT * FROM posts ORDER by id DESC")
	erb:index,{:locals=>{:posts=>posts}}
end

get '/hello' do
	"Hello world!!!!!!"
end

get '/example' do
	erb :example
end
post '/' do
	stmt=db.prepare("insert into posts (text) values (?)")
	stmt.execute
	redirect '/'
end