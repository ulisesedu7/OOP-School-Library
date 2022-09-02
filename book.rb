require_relative './rental'
require_relative './person'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author
  attr_reader :reentals

  def add_rental(rental)
    @rentals.push(rental)
  end
end
