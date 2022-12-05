# --- Day 5: Supply Stacks ---

STACKS = []

def build_stacks(input)
    for i in 0..(input.size - 1) do
        stack_line = input[i].gsub("\n", "")
        return unless stack_line.strip.start_with?('[')

        crates = stack_line.chars.each_slice(4).map(&:join)
        crates.each_with_index do |crate, index|
            next if crate.strip.empty?

            stack = STACKS[index].nil? ? [] : STACKS[index]
            stack.push(crate[1])
            STACKS[index] = stack
        end
    end
end

def move_stacks(input)
    for i in 0..(input.size - 1) do
        instruction = input[i].strip
        next unless instruction.start_with?("move")

        puts "instruction = #{instruction}"
        count, orig, dest = instruction.match(/move (\d+) from (\d+) to (\d+)/).captures.map(&:to_i)
        puts "count = #{count}, orig = #{orig}, dest = #{dest}"
        orig_stack = STACKS[orig - 1]
        dest_stack = STACKS[dest - 1]
        for num in 1..count do
            moved = orig_stack.shift
            dest_stack.unshift(moved)
        end
        puts STACKS.inspect
        puts
        # STACKS[orig - 1] = orig_stack
        # STACKS[dest - 1] = dest_stack
    end
end

input = [
    "    [D]    \n",
    "[N] [C]    \n",
    "[Z] [M] [P]\n",
    "1   2   3  \n",
    "\n",
    "move 1 from 2 to 1\n",
    "move 3 from 1 to 3\n",
    "move 2 from 2 to 1\n",
    "move 1 from 1 to 2\n",
]

input = File.readlines('day5-input.txt')

build_stacks(input)
puts STACKS.inspect

move_stacks(input)
puts STACKS.inspect

puts STACKS.map { |row| row.shift }.join
