# Toy Robot

This Toy Robot is written in Ruby.

## Setup
- `brew install ruby`
- `gem install bundler`
- `bundle`

## Running Tests

To run the whole test

```
bundle exec rspec
```

To run specific test

```
bundle exec rspec spec/robot_spec.rb
```

## Running the program

To run the program

```
ruby lib/main.rb
```

### Examples

```plain
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH
```

```plain
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST
```

```plain
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
```

## Considerations
- I have decided to use the CommandParser to parse the comamnd, and give the command to the robot. The code is little bit verbose, we could maybe refactor this and also maybe CommandParse is not the best name for this class.
- The CommandParse's test has some repetitive tests. I reckon we could make it DRY.
- Table class, is very simple and has a basic check whether the position is valid or not.
- Robot class, has the logics to handle all the commands including the next potential move.
