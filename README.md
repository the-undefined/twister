# Twister

Kids too young to spin the twister spinner for the adults? That's where this script originated from.

If you have played on a new twister board you may have experienced the new types of moves:

- spinners choice
- put a limb in the air

This script spits out some random actions to mimic the 'spinners choice' and also support the limbs in the air.

Have fun!

## Usage

Make sure you have a version of ruby installed (for now), and download the script.

```
$ git clone git@github.com:the-undefined/twister.git
$ cd twister
```

You can run the script with several options, these can be found with the help flag:

```
$ ruby twister.rb --help
Usage: ruby twister.rb [options]
  -s, --speak                      Speak the commands outloud
  -p, --players=LIST               Comma seperated list of player names
  -i, --interval=INT               Number of seconds between each spin
```

An example of four people playing with each command being printed every 3 seconds.

```
$ ruby twister.rb -pJoe,Claire,Sammy,Martin
  Joe, put your left foot on yellow
  Claire, put your left hand on yellow
  Sammy, put your left hand on blue
  Martin, bark like a dog three times
  Joe, put your right hand in the air
```

If you are on OSX you can take advantage of it's built in `say` command and get the commands spoken aloud by the Mac as well as printed:

```
$ ruby twister.rb -pJoe,Claire,Sammy,Martin --speak
```

If you would like to make the game harder or easier you can set the interval between the commands (defaults to 3 seconds):

```
# Drunk / Yoga mode:
$ ruby twister.rb -i10 -pJoe,Claire,Sammy,Martin

# Faster:
$ ruby twister.rb -i2  -pJoe,Claire,Sammy,Martin
```

## Plans / TODO

- [ ] convert script to a gem
- [ ] don't command players to move to colours that are all taken
- [ ] add pattern sequences for players to follow across moves ('Crab', 'Monkey', 'Sleeping tiger')
- [ ] create a visual representation of moves (maybe with `gosu` or a web app)
- [ ] replace reliance on the `say` command, possibly with audio files
