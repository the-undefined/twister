require 'optparse'

options = {
  players: ['Player One'],
  interval: 3,
}

OptionParser.new do |opts|
  opts.banner = "Usage: ruby twister.rb [options]"

  opts.on("-s", "--speak", "Speak the commands outloud") do
    options[:method] = :speak
  end

  opts.on("-pLIST", "--players=LIST", "Comma seperated list of player names") do |ppl|
    options[:players] = ppl.split(',')
  end

  opts.on("-i", "--interval=INT", "Number of seconds between each spin") do |int|
    options[:interval] = Integer(int)
    raise "choose at least a one second interval" unless options[:interval] > 0
  end
end.parse!

players = options.fetch(:players, ['Player One']).to_enum

mat = [
  [:r1, :r2, :r3, :r4, :r5, :r6],
  [:b1, :b2, :b3, :b4, :b5, :b6],
  [:y1, :y2, :y3, :y4, :y5, :y6],
  [:g1, :g2, :g3, :g4, :g5, :g6],
]

side = ['left', 'right']
body_part = ['foot', 'hand']
color = [:red, :blue, :green, :yellow]

random_action = [
  "pat your head five times",
  "tickle an opponent",
  "sing 'row, row, your boat'",
  "bark like a dog three times",
  "pat the spot",
  "hop on one foot",
  "sing happy birthday",
  "wiggle your hips",
  "do something imaginative",
  "make nautical noises",
  "hot potato an opponent"
]

move_to_color = -> { "put your #{side.sample} #{body_part.sample} on #{color.sample}" }

# make it more likely to have the basic move come up,
# and less likely for the unusual moves by stacking the
# quantity of possible choice types.
move_types =
  Array.new(2,
            -> { move_to_color.call }
           ) +
  Array( -> { "put your #{side.sample} #{body_part.sample} in the air"} ) +
  Array( -> { "#{move_to_color.call} and #{random_action.sample}" } )

loop do
  players.rewind

  players.count.times do

    person = players.next
    action = move_types.sample.call
    command = "#{person}, #{action}"

    if options[:method] == :speak
      `say #{command}`
      puts command
    else
      puts command
    end

    sleep options[:interval]
  end
end
