require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

   get '/' do
     erb :new
   end

   get '/new' do
     erb :new
   end

   post '/teams' do
     @team = Team.new(params[:team])
     params[:team][:superheroes].each do |item|
       SuperHero.new(item)
   end
   @superhero = SuperHero.all
   
   erb :team
end
end