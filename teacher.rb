require_relative './person.rb'

class Teacher < Person
  def initialize(name = "Unknown", age, parent_permission = true, specialization)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end