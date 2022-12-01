# --- Day 1: Calorie Counting ---
# https://adventofcode.com/2022/day/1

def most_calories(elf_calories)
    max_calories = 0
    max_elf_index = 0

    current_calories = 0
    current_elf_index = 0

    elf_calories.map(&:to_i).each_with_index.map do |value, index|
        if index == elf_calories.count - 1 || value == 0
            if (max_calories < current_calories)
                max_calories = current_calories
                max_elf_index = current_elf_index
            end

            current_calories = 0
            current_elf_index += 1
            next
        end

        current_calories += value
    end

    max_calories
end

def top_total_calories(elf_calories, num_top = 3)
    max_calories = []

    current_calories = 0
    current_elf_index = 0

    elf_calories.map(&:to_i).each_with_index.map do |value, index|
        if index == elf_calories.count - 1
            current_calories += value
        end
        if index == elf_calories.count - 1 || value == 0
            if max_calories.count < num_top
                max_calories.push(current_calories)
            else
                lowest_index = max_calories.index { |v| v < current_calories }
                max_calories[lowest_index] = current_calories unless lowest_index.nil?
            end

            # Sorting ensures the lowest value is replaced
            max_calories.sort!

            current_calories = 0
            current_elf_index += 1
            next
        end

        current_calories += value
    end

    max_calories.sum
end

# Test input, should result in 4th elf who carries 24000 calories
# elf_calories = [
#     "1000\n",
#     "2000\n",
#     "3000\n",
#     "\n",
#     "4000\n",
#     "\n",
#     "5000\n",
#     "6000\n",
#     "\n",
#     "7000\n",
#     "8000\n",
#     "9000\n",
#     "\n",
#     "10000\n",
# ]

elf_calories = File.readlines('day1-input.txt')

# Part 1
# puts most_calories(elf_calories)

# Part 2
puts top_total_calories(elf_calories)
