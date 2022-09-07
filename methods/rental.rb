require_relative './person'
require_relative './book'

class Rental
  attr_accessor :date, :book_title, :book_author, :person_id
  attr_reader :book, :person

  def initialize(date, book, book_title, book_author, person, person_id)
    @date = date

    @book = book
    # @book.add_rental(self)

    @book_title = book_title
    @book_author = book_author

    @person = person
    # @person.add_rental(self)

    @person_id = person_id
  end
end
