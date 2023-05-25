class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts "There are no books"
    else
      puts "List of books:"
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts "There are no people"
    else
      puts "List of people:"
      @people.each do |person|
        puts "ID: #{person.id}, Name: #{person.correct_name}, Age: #{person.age}"
      end
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i

    case type
    when 1
      puts 'Age:'
      age = gets.chomp.to_i
      puts 'Name:'
      name = gets.chomp
      puts 'Does the student have permission? [true/false]:'
      parent_permission = gets.chomp.downcase == 'true'
      puts "Enter student's classroom (optional):"
      classroom = gets.chomp

      student = Student.new(generate_person_id, name, age, parent_permission, classroom)
      @people << student
      puts "#{student.correct_name} has been successfully added"
    when 2
      puts 'Age:'
      age = gets.chomp.to_i
      puts 'Name:'
      name = gets.chomp
      puts 'Does the teacher have permission? [true/false]:'
      parent_permission = gets.chomp.downcase == 'true'
      puts "Enter teacher's specialization (optional):"
      specialization = gets.chomp

      teacher = Teacher.new(generate_person_id, name, age, parent_permission, specialization)
      @people << teacher
      puts "Teacher #{teacher.correct_name} has been added successfully"
    else
      puts "Invalid person type, please choose either student (1) or teacher (2)."
    end
  end

  def create_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter author\'s name:'
    author = gets.chomp

    new_book = Book.new(title, author)
    @books << new_book
    puts "Book #{new_book.title} has been successfully created"
  end

  def create_rental
    puts "Enter person ID:"
    person_id = gets.chomp.to_i
    puts "Enter book title:"
    book_title = gets.chomp
    puts "Enter rental date:"
    date = gets.chomp

    person = @people.find { |p| p.id == person_id }
    book = @books.find { |b| b.title == book_title }

    if person.nil?
      puts "Person not found"
    elsif book.nil?
      puts "Book not found"
    else
      rental = Rental.new(person, book, date)
      @rentals << rental
      puts "Rental created. Person: #{person.correct_name}, Book: #{book.title}, Date: #{rental.date}"
    end
  end

  def list_rentals(person_id)
    person = @people.find { |p| p.id == person_id }

    if person.nil?
      puts "Person not found"
    else
      puts "Rentals for person: #{person.correct_name}"
      rentals = @rentals.select { |r| r.person == person }
      rentals.each do |rental|
        puts "Book: #{rental.book.title}, Date: #{rental.date}"
      end
    end
  end

  private

  def generate_person_id
    @people.size + 1
  end
end
