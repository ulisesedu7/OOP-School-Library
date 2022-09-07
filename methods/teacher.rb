require_relative './person'

class Teacher < Person
  def initialize(age, name, id, specialization = 'Computer Science', type = 'Teacher')
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
