require 'sinatra'
require 'firebase'
require 'pry'
require 'json'

class FirebaseApp < Sinatra::Base
  base_uri = 'https://popping-inferno-944.firebaseio.com/'

  set :bind, '0.0.0.0'

  get '/' do
    erb :index
  end

  post '/' do
    params['server_says'] = `fortune`
    puts params
    fb = Firebase::Client.new(base_uri)
    fb.push('todos', params)
    'OK'
  end
end
