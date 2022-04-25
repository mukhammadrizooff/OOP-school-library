module ReStudent
  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    if age <= 0
      @id -= 1
      return puts 'Wrong input for age. Returning to main menu'
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Has Parent Permission? [Y/N]: '
    permission = gets.chomp.strip.upcase
    case permission
    when 'Y', 'YES'
      permission = true
    when 'N', 'NO'
      permission = false
    end
    student = Student.new(@id, age, nil, name, parent_permission: permission)
    @people << student
    puts 'Person created successfully'
  end

  #create a rental

  def create_rental
    puts 'Select a book from the following list by number'
    list_all_books
    book_selected = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_all_people
    person_selected = gets.chomp.to_i
    puts
    print 'Date (YYYY/MM/DD) : '
    date = gets.chomp.strip
    Rental.new(date, @books[book_selected], @people[person_selected])
    puts 'Rental created successfully'
  end
end

