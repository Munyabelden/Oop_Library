require_relative 'render'

class Main
  def initialize
    @render = Render.new
  end

  puts 'Welcome, choose an option below:\n'
  def main
    loop do
      @render.list_options
      choice = @render.get_request('Enter your choice: ', :to_i)

      case choice
      when 1..6
        @render.execute_action(choice)
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
