require_relative './person'

class Teacher < Person
  def initialize(age, name, specialization = 'Computer Science', type = 'Teacher')
    super(age, name)
    @specialization = specialization
    @type = type
  end

  attr_accessor :type

  def can_use_service?
    true
  end
end
