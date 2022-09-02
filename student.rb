require_relative './person'
require_relative './classroom'

class Student < Person
  def initialize(classroom)
    super()
    @classroom = classroom
  end

  # Belong-to relationship
  attr_reader :classroom

  def play_hooky
    "¯\(ツ)/¯"
  end

  # Add student to the classroom students
  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
