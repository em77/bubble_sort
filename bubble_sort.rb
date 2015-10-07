# Accepts unsorted array and returns sorted array
def bubble_sort(array)
  swap_status = nil
  iterations = 0

  until swap_status == false
    swap_status = false
    array[0..((array.count - 1) - iterations)].each_with_index do |item, index|
      if item != array.last
        if array[index] > array[index + 1]
          array[index], array[index + 1] = array[index + 1], array[index]
          swap_status = true
        end
      end
    end
    iterations += 1
  end
  array
end

# Accepts block which returns result similar to using spaceship operator for
# comparing elements when handling sorting
def bubble_sort_by(array)
  swap_status = nil
  iterations = 0

  until swap_status == false
    swap_status = false
    working_array = array[0..((array.count - 1) - iterations)]
    working_array.each_with_index do |item, index|
      if item != working_array.last
        if yield(array[index], array[index + 1]) < 0
          array[index], array[index + 1] = array[index + 1], array[index]
          swap_status = true
        end
      end
    end
    iterations += 1
  end
  array
end

puts bubble_sort([4,3,78,2,0,2])
puts "-----"
puts bubble_sort_by(["hi","hello","hey"]) { |left,right|
    right.length - left.length}