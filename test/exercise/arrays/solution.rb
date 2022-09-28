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

      def search(_array, _query)
        0
      end
    end
  end
end
