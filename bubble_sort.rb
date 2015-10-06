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