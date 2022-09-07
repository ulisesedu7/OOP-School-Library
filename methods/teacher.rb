require_relative './person'

class Teacher < Person
  def initialize(age, name, id = Random.rand(1..1000), specialization = 'Computer Science', type = 'Teacher')
    super(age, name)
    @specialization = specialization
    @type = type
    @id = id
  end

  attr_accessor :type

  def can_use_service?
    true
  end
end
