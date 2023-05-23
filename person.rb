class Person
  def initialize(id, name = "unknown", age, parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def id
    @id
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def age
    @age
  end

  def age=(new_age)
    @age = new_age
  end

  private

  def of_age?
    age >= 18
  end

  public

  def can_use_service?
    age >= 18 || parent_permission == true
  end
end

person = Person.new(1, "Belden Mugauri", 23, parent_permission: true)

puts person.id
puts person.name
puts person.age
puts person.can_use_service?
