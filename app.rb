require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'twitter'


client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "bf1wlM91D9XYRN9voC4Ibs26d"
    config.consumer_secret     = "gQsJh5TlPh6RBZlIJNQ14N2BhMOxRpLppeyaercdVnZKG8ozfe"
    config.access_token        = "785420680233750528-tfXh6FMxCqAoqLtCsoMc4hLfIX0Or3H"
    config.access_token_secret = "fwT1neZbtFHFgqC18fjyXswTQ0EMIs7xBaSRQ0Af34LRR"
end

get '/' do 
    erb :index
end

post '/tweet' do  
    @sentence = params[:yaruzo]
    client.update(@sentence)
    redirect '/'
end
