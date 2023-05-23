require_relative 'person'

class Teacher < Person
  attr_reader :parent_permission, :specialization

  def initialize(id, age, name = 'unknown', specialization: nil, parent_permission: true)
    super(id, name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
