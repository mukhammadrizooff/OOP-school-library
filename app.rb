require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './book'
require_relative './create_methods'
require_relative './list_methods'

class App
  include CreateMethods
  include ListMethods

  def initialize
    @people = []
    @books = []
    @id = 50
  end

  def run
    selection = nil
    puts 'Welcome to School Library App!'
    while selection != 7
      display_options
      selection = gets.chomp.strip.to_i
      do_task(selection)
    end
    puts 'Thank you for using this app!'
  end

  def display_options
    puts
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def do_task(selection)
    case selection
    when 1, 2, 6
      list_tasks(selection)
    when 3, 4, 5
      create_tasks(selection)
    when 7
      nil
    else
      puts 'Wrong input, please select one of the options from the menu'
    end
  end

  def list_tasks(selection)
    case selection
    when 1
      list_all_books
    when 2
      list_all_people
    when 6
      list_person_rentals
    end
  end
end
