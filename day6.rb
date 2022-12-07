# --- Day 6: Tuning Trouble ---

def marker_for(buffer, seq_length = 4)
    index = 0
    buffer.chars.each_cons(seq_length) do |seq|
        break if seq.uniq.size == seq_length
        index += 1
    end
    index + seq_length
end

input = [
    "bvwbjplbgvbhsrlpgdmjqwftvncz", #: first marker after character 5
    "nppdvjthqldpwncqszvftbrmjlhg", #: first marker after character 6
    "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", #: first marker after character 10
    "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", #: first marker after character 11
]

input = File.readlines('day6-input.txt')

puts marker_for(input[0])
