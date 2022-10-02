module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        selected_films = array.reject { |film| film['rating_kinopoisk'].to_f.zero? }.select { |film| film['country'].to_s.split(',').size > 1 }
        accumulate_rating = selected_films.map { |film| film['rating_kinopoisk'].to_f }.reduce(:+)
        accumulate_rating / selected_films.size
      end

      def chars_count(films, threshold)
        char = 'и'
        films.select { |film| film['rating_kinopoisk'].to_f >= threshold }.map { |film| film['name'].count(char) }.reduce(:+)
      end
    end
  end
end
