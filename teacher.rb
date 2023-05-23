require_relative 'person.rb'

class Teacher < Person
  def initialize(id, name = "unknown", age, parent_permissions = true, specialization)
    super(id, name, age, parent_permissions)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end