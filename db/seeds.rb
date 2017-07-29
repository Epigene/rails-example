require 'prime'

print "Seeding genres... "
%w|horror adventure sci-fi fantasy|.each do |genre|
  Genre.where(identifier: genre).first_or_create!
end
puts "done!"

print "Seeding 100 publishers... "
100.times do |i|
  Publisher.where(name: "Publisher#{i}").first_or_create!
end
puts "done!"

print "Seeding 1000 authors... "
1000.times do |i|
  Author.where(identifier: "Author#{i}", name: "Pen name #{i}", dob: ("1977-01-01".to_date + i.days)).first_or_create!
end
puts "done!"

print "Seeding 10000 books..."
10000.times do |i|
  book = Book.where(
    identifier: "Book#{i}",
    publisher_id: (i % 100 + 1),
    author_id: (i % 1000 + 1),
    title: "Book title #{i}",
    published_on: ("2000-01-01".to_date + i.days)
  ).first_or_create!
  BookGenre.where(book_id: book.id, genre_id: Genre.find_by(identifier: "sci-fi").id).first_or_create! if Prime.prime?(i) # prime books are scifi
  BookGenre.where(book_id: book.id, genre_id: Genre.find_by(identifier: "fantasy").id).first_or_create! if i % 2 == 0 # even books are fantasy
  BookGenre.where(book_id: book.id, genre_id: Genre.find_by(identifier: "horror").id).first_or_create! if i % 3 == 0 # multiples of three are horror
  BookGenre.where(book_id: book.id, genre_id: Genre.find_by(identifier: "adventure").id).first_or_create! if i % 4 == 0 # multiples of four are   adventure
  print " #{10000 - i}"
end
puts " done!"

puts "All seeded!"
