
class Book
  attr_accessor :author, :title, :id, :status, :borrower


  def initialize(title,author)
    @author = author
    @title = title
    @status = 'available'
  end

  def check_out()
    if @status == 'available'
      @status = 'checked_out'
    else
      false
    end
  end

  def check_in()
     if @status == 'checked_out'
       @status = 'available'
     end
  end

end



# _______________________________BORROW CLASS________________________________________________________________

class Borrower
  attr_accessor :name

  def initialize(name)
    @name = name
  end

end


#____________________________LIBRARY CLASS________________________________________________________
class Library

  attr_accessor :title
  attr_accessor :author
  attr_accessor :books
  attr_accessor :borrowerhash

  def initialize(name)
    @books = []
    @idcounter = 50
    @borrowerhash = {}
  end

  def register_new_book(title,author,id=nil)
    book = Book.new(title,author)
    book.id = @idcounter
    @idcounter += 1
    @books.push(book)
  end


  def add_book(title, author)

  end

  def check_out_book(book_id, borrower)
    if @borrowerhash[book_id] == nil
      # if borrower appears in @borrowerhash < 3.
      all_borrowers_in_list = @borrowerhash.values
      if all_borrowers_in_list.count(borrower) < 2

      #
        book = @books.find {|book| book.id == book_id}
        book.check_out
        @borrowerhash.store(book_id, borrower)
        return book
      else
        return nil
      end
        # nil
    else
      return nil
    end
  end



  def get_borrower(book_id)
    name = @borrowerhash[book_id].name
    return name
  end


  def check_in_book(book)
    #check book back in, change status to available, delete his name from the hash
    if book.status == 'checked_out'
      book.status = 'available'
      #delete the users name from the hash
    else
      puts "Book cannot be checked in because it is not checked_out"
    end

  end

  def available_books
    available_book_total = []
    @books.each do |book|
      if book.status == 'available'
        available_book_total.push(book)
      end
    end
    return available_book_total
  end

  def borrowed_books
    borrowed_book_total = []
    @books.each do |book|
      if book.status == 'checked_out'
        borrowed_book_total.push(book)
      end
    end
    return borrowed_book_total
  end
end


    # lib = Library.new('library')
    # lib.register_new_book("Eloquent JavaScript", "Marijn Haverbeke")
    # lib.register_new_book("Essential JavaScript Design Patterns", "Addy Osmani")
    # lib.register_new_book("JavaScript: The Good Parts", "Douglas Crockford")
    # jordan = Borrower.new("Michael jordan")


