require 'sinatra'
require 'sinatra/reloader'
require 'pry'

set :number, rand(0..100)

get '/' do
  guess = params["guess"].to_i
  guess_method = number_guesser(guess)
  erb :index, :locals => {:number => settings.number, :guess_method => guess_method}
end

def number_guesser(guess)
  if guess < (settings.number - 5)
    "WAY too low! (You are more than 5 below the number)"
  elsif guess > (settings.number + 5)
    "WAY too high! (You are more than 5 above the number)"
  elsif guess > settings.number
    "Too high!"
  elsif guess < settings.number
    "Too low!"
  else
    "You got it right! The SECRET NUMBER is #{settings.number}"
  end
end
