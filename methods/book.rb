require_relative './rental'
require_relative './person'

class Book
  attr_accessor :title, :author, :rentals
  attr_reader :id

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @id = Random.rand(1..1000)
  end

  def add_rental(rental)
    @rentals.push(rental)
  end
end
