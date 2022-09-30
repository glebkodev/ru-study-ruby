module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(index = 0, &func)
        return self if index == size

        func.call(self[index])
        my_each(index + 1, &func)
      end

      # Написать свою функцию my_map
      def my_map(&func)
        my_reduce(MyArray.new) { |accumulator, element| accumulator << func.call(element) }
      end

      # Написать свою функцию my_compact
      def my_compact; end

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
