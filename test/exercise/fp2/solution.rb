module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(array = nil, &func)
        head, *tail = array || self
        func.call(head)
        return self if tail.empty?

        my_each(tail, &func)
      end

      # Написать свою функцию my_map
      def my_map(&func)
        my_reduce(MyArray.new) { |accumulator, element| accumulator << func.call(element) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) do |accumulator, element|
          accumulator << element unless element.nil?
          accumulator
        end
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial_value = nil, &func)
        if initial_value.nil?
          ignore_first = true
          initial_value = first
        end

        iter = lambda { |accumulator, index|
          return accumulator if index == size

          accumulator = func.call(accumulator, self[index]) unless ignore_first && index.zero?
          iter.call(accumulator, index + 1)
        }

        iter.call(initial_value, 0)
      end
    end
  end
end
