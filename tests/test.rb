require_relative '../methods/person'
require_relative '../decorators/decorator'

person = Person.new(22, 'maximilianus')
puts person.correct_name

capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name
