require_relative './rental'
require_relative './person'

class Book
  attr_accessor :title, :author
  attr_reader :reentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end
end
