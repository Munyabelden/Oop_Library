require_relative 'person.rb'

class Teacher < Person
  attr_reader :parent_permission
  attr_reader :specialization

  def initialize(id, name = "unknown", age,  specialization: nil, parent_permission: true)
    super(id, name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end

teacher = Teacher.new(1, "Belden Mugauri", 23, parent_permission: true, specialization: "React")

puts teacher.name
puts teacher.id
puts teacher.parent_permission
puts teacher.age
puts teacher.specialization
puts teacher.can_use_service?
