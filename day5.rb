# --- Day 5: Supply Stacks ---

STACKS = []

def build_stacks(input)
    for i in 0..(input.size - 1) do
        stack_line = input[i].gsub("\n", "")
        return unless stack_line.strip.start_with?('[')

        crates = stack_line.chars.each_slice(4).map(&:join)
        puts "crates = #{crates}"
        crates.each_with_index do |crate, index|
            next if crate.strip.empty?
            puts "#{index} = #{crate}"
            stack = STACKS[index].nil? ? [] : STACKS[index]
            stack.push(crate[1])
            STACKS[index] = stack
        end
    end
end

input = [
    "[D]        \n",
    "[N] [C]    \n",
    "[Z] [M] [P]\n",
    "1   2   3  \n",
    "\n",
    "move 1 from 2 to 1\n",
    "move 3 from 1 to 3\n",
    "move 2 from 2 to 1\n",
    "move 1 from 1 to 2\n",
]

# input = File.readlines('day5-input.txt')

build_stacks(input)
puts STACKS.inspect
