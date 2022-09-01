require_relative './person'
require_relative './decorator'

person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalizedPerson = CapitalizeDecorator.new(person)
p capitalizedPerson.correct_name

capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
p capitalizedTrimmedPerson.correct_name
