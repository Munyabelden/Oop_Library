require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'book'
require_relative 'Rental'
require 'date'


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

  attr_reader :id, :rentals
  attr_accessor :name, :age, :parent_permission

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end

person1 = Person.new(25, 'John Doe')
date1 = Date.today
book1 = Book.new('Title 1', 'Author 1')
rental1 = book1.add_rental(person1, date1)
puts rental1.person == person1 # Expected: true
puts rental1.book == book1 # Expected: true
puts person1.rentals.include?(rental1) # Expected: true
puts book1.rentals.include?(rental1) # Expected: true
