module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element = max_element_in_array(array)
        array.map { |element| element.positive? ? max_element : element }
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

      private

      def max_element_in_array(array)
        max_element = array.first
        array.each { |element| max_element = element if element > max_element }
        max_element
      end
    end
  end
end
