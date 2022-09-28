module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element = max_element_in_array(array)
        new_array = []
        array.each { |element| new_array << (element.positive? ? max_element : element) }
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

      private

      def max_element_in_array(array)
        max_element = array.first
        array.each { |element| max_element = element if element > max_element }
        max_element
      end
    end
  end
end
