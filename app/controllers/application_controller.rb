require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :team
    end

    post '/teams' do
      #binding.pry
      @team = Team.new(params[:team])

      params[:team][:heroes].each do |hero_data|
        Hero.new(hero_data)
      end

      @heroes = Hero.all

      erb :super_hero
    end
  end