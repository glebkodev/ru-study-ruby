module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element = max_element_in_array(array)
        array.map { |element| element.positive? ? max_element : element }
      end

      def search(array, query, left = 0, right = array.size - 1)
        return -1 if left > right || array.empty?

        mid = (left + right) / 2
        return mid if query == array[mid]

        query > array[mid] ? search(array, query, mid + 1, right) : search(array, query, left, mid - 1)
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
