require_relative './person'
require_relative './book'

# rubocop:disable Metrics/ParameterLists
class Rental
  attr_accessor :date, :book_title, :book_author, :person_id
  attr_reader :book, :person

  def initialize(date, book, book_title, book_author, person, person_id)
    @date = date

    @book = book

    @book_title = book_title
    @book_author = book_author

    @person = person

    @person_id = person_id
  end
end
# rubocop:enable Metrics/ParameterLists
