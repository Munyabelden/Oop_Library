require_relative 'person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(id, age, name = 'unknown', parent_permission: true, classroom: nil)
    super(id, name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
