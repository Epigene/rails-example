namespace :bench do

  desc "Compares two versions of latest books by author"
  # rails bench:last_books
  task "last_books" => :environment do
    Benchmark.bmbm do |x|
      x.report("Book.authors_last_books") { 100.times { Book.authors_last_books } }
      x.report("Book.authors_last_books2")  { 100.times { Book.authors_last_books2 } }
    end
  end

end
