class Reader < ApplicationRecord
  has_many :books

  before_destroy :detach_books

  def detach_books
    books.each do |book|
      book.update(reader_id: nil)
    end
  end
end
