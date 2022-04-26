module CreateMethods
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

  # create a rental

  def create_rental
    puts 'Select a book from the following list by number'
    list_all_books
    book_selected = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    list_all_people
    person_selected = gets.chomp.to_i
    print 'Date (YYYY/MM/DD) : '
    date = gets.chomp.strip
    Rental.new(date, @books[book_selected], @people[person_selected])
    puts 'Rental created successfully'
  end

  # create task
  def create_tasks(selection)
    case selection
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    end
  end

  # create a person

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_selected = gets.chomp.strip.to_i

    case person_selected
    when 1
      create_student
      @id += 1
    when 2
      create_teacher
      @id += 1
    else
      puts 'Invalid Selection. Returning to main menu'
      nil
    end
  end

  # create a teacher

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    if age <= 0
      @id -= 1
      return puts 'Wrong input for age. Returning to main menu'
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Specialization: '
    specialization = gets.chomp.strip.capitalize
    teacher = Teacher.new(@id, age, specialization, name)
    @people << teacher
    puts 'Person created successfully'
  end

  # create a book

  def create_book
    print 'Title: '
    title = gets.chomp.strip.capitalize
    print 'Author: '
    author = gets.chomp.strip.capitalize
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end
end
