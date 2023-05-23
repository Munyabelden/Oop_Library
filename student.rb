require_relative 'person.rb'

class Student < Person
  attr_reader :classroom
  attr_reader :parent_permission

  def initialize(id, name = "unknown", age, parent_permission: true, classroom: nil)
    super(id, name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\\(ツ)/¯"
  end
end

student = Student.new(1, "Belden Mugauri", 23, parent_permission: true, classroom: "Class E")

puts student.name
puts student.id
puts student.parent_permission
puts student.age
puts student.classroom
puts student.play_hooky
