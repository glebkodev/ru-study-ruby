module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element = array.first
        for current_element in array
          max_element = current_element if current_element > max_element
        end

        new_array = []
        for current_element in array
          new_array << (current_element.positive? ? max_element : current_element)
        end

        new_array
      end

      def search(array, query)
        left = 0
        right = array.size - 1
        mid = 0
        while left <= right
          mid = left + ((right - left) / 2)
          if query < array[mid]
            right = mid - 1
          elsif query > array[mid]
            left = mid + 1
          else
            return mid
          end
        end
        -1
      end
    end
  end
end
