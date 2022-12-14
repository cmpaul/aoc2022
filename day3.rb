# --- Day 3: Rucksack Reorganization ---

# Lowercase item types a through z have priorities 1 through 26.
# Uppercase item types A through Z have priorities 27 through 52.
def priority(item_type)
    return (item_type.ord - 96) if item_type.match /[[:lower:]]/
    item_type.ord - 38
end

# def shared_item(rucksack)
#     first = rucksack[0..rucksack.size/2 - 1]
#     second = rucksack[rucksack.size/2..]
#     first.chars.each do |l|
#         return l if second.include?(l)
#     end
#     raise "No common item found! #{rucksack}"
# end

# part 1
# def priority_sum(rucksacks)
#     rucksacks.map { |rucksack| priority(shared_item(rucksack)) }.sum
# end

def shared_item(rucksacks)
    rucksacks[0].chars.each do |l|
        next unless rucksacks[1].include?(l)
        return l if rucksacks[2].include?(l)
    end
    raise "No common item found! #{rucksack}"
end

def priority_sum(rucksacks)
    rucksacks.each_slice(3).to_a.map { |rucksacks| priority(shared_item(rucksacks)) }.sum
end

rucksacks = %w[
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
]

rucksacks = File.readlines('day3-input.txt')
puts priority_sum(rucksacks)
