require_relative '../decorators/nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission, :type

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
    @rentals = []
  end

  def can_use_service?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
