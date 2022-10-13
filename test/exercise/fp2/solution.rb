module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&func)
        head, *tail = self
        func.call(head)
        return if tail.empty?

        MyArray.new(tail).my_each(&func)
        self
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
      def my_reduce(accumulator = nil, &func)
        return accumulator if empty?

        head, *tail = self
        accumulator = accumulator.nil? ? head : func.call(accumulator, head)
        MyArray.new(tail).my_reduce(accumulator, &func)
      end
    end
  end
end
