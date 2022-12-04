# --- Day 4: Camp Cleanup ---

def fully_contained?(assignment)
    first, second = assignment.strip.split(',')
    first_lower, first_upper = first.split('-').map(&:to_i)
    second_lower, second_upper = second.split('-').map(&:to_i)
    return first_lower >= second_lower && first_upper <= second_upper ||
        second_lower >= first_lower && second_upper <= first_upper
end

def overlap?(assignment)
    first, second = assignment.strip.split(',')
    first_lower, first_upper = first.split('-').map(&:to_i)
    second_lower, second_upper = second.split('-').map(&:to_i)
    return first_lower >= second_lower && first_lower <= second_upper ||
        first_upper >= second_lower && first_upper <= second_upper
end

# assignments = %w[
#     2-4,6-8
#     2-3,4-5
#     5-7,7-9
#     2-8,3-7
#     6-6,4-6
#     2-6,4-8
# ]
assignments = File.readlines('day4-input.txt')

# part 1
# puts assignments.select { |assignment| fully_contained?(assignment) }.size

# part 2
puts assignments.select { |assignment| fully_contained?(assignment) }.size
