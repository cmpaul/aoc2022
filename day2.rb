# --- Day 2: Rock Paper Scissors ---

SHAPE_SCORE = {
    'X' => 1, # Rock
    'Y' => 2, # Paper
    'Z' => 3, # Scissors
}

THEY_WIN = {
    'A' => 'Z', # Rock beats scissors
    'B' => 'X', # Paper beats rock
    'C' => 'Y', # Scissors beat paper
}

YOU_WIN = {
    'X' => 'C', # Rock beats scissors
    'Y' => 'A', # Paper beats rock
    'Z' => 'B', # Scissors beat paper
}

SHAPE_MAP = {
    'A' => 'X',
    'B' => 'Y',
    'C' => 'Z',
}

YOU_LOST = 0
YOU_DRAW = 3
YOU_WON = 6

# Your total score is the sum of your scores for each round.
def total_score(rounds)
    rounds.map { |round| score(round) }.sum
end

# The score for a single round is the score for the shape you selected (1 for Rock, 2 for Paper, and 3 for Scissors)
# plus the score for the outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won).
def score(round)
    their_shape, your_outcome = round.strip.split(' ')
    if your_outcome == 'X' # Lose
        your_shape = THEY_WIN[their_shape]
    elsif your_outcome == 'Y' # Draw
        your_shape = SHAPE_MAP[their_shape]
    else # Win
        your_shape = YOU_WIN.key(their_shape)
    end
    puts their_shape, your_shape
    SHAPE_SCORE[your_shape] + outcome(their_shape, your_shape)
end

def outcome(their_shape, your_shape)
    return YOU_LOST if (THEY_WIN[their_shape] == your_shape)
    return YOU_WON if (YOU_WIN[your_shape] == their_shape)
    YOU_DRAW
end

rounds = [
    "A Y",
    "B X",
    "C Z"
]

rounds = File.readlines('day2-input.txt')
puts total_score(rounds)
