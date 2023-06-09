require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'book'
require_relative 'rental'

class Person < Nameable
  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  attr_reader :id
  attr_accessor :name, :age, :parent_permission, :rentals

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def to_h
    {
      age: @age,
      name: @name,
      parent_permission: @parent_permission,
      id: @id,
      rentals: @rentals.map(&:to_h)
    }
  end
end
