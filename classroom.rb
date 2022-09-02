require_relative './student'

class Classroom
  def initialize(label)
    @label = label
    @students = []
  end

  attr_accessor :label
  attr_reader :students

  # Has-Many relationship
  def add_student(student)
    @students.push(student)

    # Add student to the classroom students
    student.classroom = self
  end
end