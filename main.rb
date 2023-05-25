require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def list_options
    puts 'Welcome, choose an option below:\n'
    actions = [
      '1 - List all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person id',
      '7 - Exit'
    ]
    puts actions
  end

  def get_request(message, input_type = :to_s)
    print message
    input = gets.chomp
    input_type == :to_i ? input.to_i : input
  end

  def main
    loop do
      list_options
      choice = get_request('Enter your choice: ', :to_i)
      case choice
      when 1
        @app.list_books
      when 2
        @app.list_people
      when 3
        @app.create_person
      when 4
        @app.create_book
      when 5
        @app.create_rental
      when 6
        person_id = get_request('Enter person ID: ', :to_i)
        @app.list_rentals(person_id)
      when 7
        break
      else
        puts 'Invalid choice, please try again'
      end
    end
  end
end

main_app = Main.new
main_app.main
