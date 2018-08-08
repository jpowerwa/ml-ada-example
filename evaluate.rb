#!/usr/bin/ruby

puts "Trained temperature?"
model = gets.chomp

puts "Temperature to predict?"
input = gets.chomp

if input < model
    puts "Prediction: Snow"
else
    puts "Prediction: Rain"
end
