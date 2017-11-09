#!/usr/bin/ruby

def load_training_data()
    data = File.readlines("temperatures.csv")
        .map {|line| line.strip.split(",")}
        .map {|point| {:temp => point[0].to_i, :precip => point[1]}}
end


def check_correctness_percent(data, candidate_temperature)
    num_correct = 0
    data.each do |point|
        prediction = point[:temp] < candidate_temperature ? "Snow" : "Rain"
        if prediction == point[:precip]
            num_correct = num_correct + 1
        end
    end
    return ((num_correct.to_f / data.size) * 100).round(2)
end


data = load_training_data()


# At first, we have no idea what is best
best_correct = 0
best_temperature = 0

(0..80).each do |candidate_temperature|

    # For each possible temparature, check the correctness
    percent_correct = check_correctness_percent(data, candidate_temperature)
    puts "#{candidate_temperature} -> #{percent_correct}% correct"


    # If we've found a better dividing line, save it
    if percent_correct > best_correct
        best_correct = percent_correct
        best_temperature = candidate_temperature
    end
end

puts "Most likey to snow when below #{best_temperature} degrees"

