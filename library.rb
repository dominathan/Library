
class Book
  attr_accessor :author
  attr_accessor :title
  attr_accessor :id
  attr_accessor :status

  def initialize(title,author)
    @author = author
    @title = title
    @status = 'available'
  end

  def check_out()
    if @status=='available'
      @status='checked_out'
    end
    # if @status=='checked_out'
    #   return false
    # end

  end

  def check_in()
     if @status == 'checked_out'
       @status = 'available'
     else
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

  def initialize(name)
    @books = []
    @idcounter = 50
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
    book = @books.find {|book| book.id }
    puts book.title
    book.check_out
    puts book.status
  end

  def check_in_book(book)
  end

  def available_books
  end

  def borrowed_books
  end
end

lib = Library.new('library')
lib.register_new_book("Green Eggs and Ham", "Dr. Seuss")
sam = Borrower.new('Sam-I-am')
lib.check_out_book(0,sam)
