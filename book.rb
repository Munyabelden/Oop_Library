class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def to_h
    {
      title: @title,
      author: @author,
      rentals: @rentals.map(&:to_h)
    }
  end

  attr_accessor :title, :author, :rentals

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
