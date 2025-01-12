input = IO.read('/home/human/Documents/GIT/aoc_2024/2/input.txt').lines.map(&:chomp)
$part_one_array = []
$safe_count = 0

def formatInput(input)
  input.each do |val|
    report = val.split(/\s+/).map(&:to_i)
    $part_one_array.push(report)
  end
  part1($part_one_array)
end

def safeCheck(input)
  increase = (0...input.length - 1).all? { |i| input[i] < input[i + 1] }
  decrease = (0...input.length - 1).all? { |i| input[i] > input[i + 1] }
  withinThree = (0...input.length - 1).all? {
    |i| (input[i] - input[i + 1]).abs >= 1 &&  (input[i] - input[i + 1]).abs <= 3
  }
  return(increase || decrease) && withinThree
end

def part1(p1Arr) # 559, #601
  p1Arr.each do |v|
    puts v
    safe = safeCheck(v)
    if safe
      $safe_count += 1
    else
      (0...v.length).each do |i|
        modified_array = v[0...i] + v[(i + 1)..-1]
        resafe = safeCheck(modified_array)
        if resafe
          $safe_count += 1
          break
        end
      end
    end
    
  end
  puts $safe_count
end


formatInput(input)
