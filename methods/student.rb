require_relative './person'
require_relative './classroom'

class Student < Person
  # Belong-to relationship
  attr_reader :classroom, :id
  attr_accessor :parent_permission, :type

  def initialize(age, name, id, type = 'Student', classroom = 'none', parent_permission: true)
    super(age, name, parent_permission:)
    @classroom = classroom
    @type = type
    @id = id
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  # Add student to the classroom students
  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
