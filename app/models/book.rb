# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  identifier   :text             not null
#  publisher_id :integer          not null
#  author_id    :integer          not null
#  title        :text             not null
#  published_on :date             not null
#

class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher

  has_many :book_genres
  has_many :genres, through: :book_genres

  after_save :do_something

  validates :identifier, :title, :published_on, presence: true
  validates :author, :author_id, :publisher, :publisher_id, presence: true

  scope :authors_last_books, -> {
    # from https://stackoverflow.com/a/123481/3319298

    # Uses LEFT JOIN to join the books table with itself in a fancy manner - on id AND the relevant, :published_on row.
    # The check on published_on make it so that the last records have NULLs in t2 rows, so we use WHERE to select those and done.

    where(id: connection.execute(LAST_BOOK_QUERY).pluck("id"))
  }

  # NB, this is 4x slower than v1 ^
  scope :authors_last_books2, -> {
    # differs from v1 in that this uses find_by_sql that returns an array of hashes as opposed to execute's PG object that can be plucked

    where(id: find_by_sql(LAST_BOOK_QUERY))
  }

  # NB, this is some 500 times faster than v1, best version yet!
  scope :authors_last_books3, -> {
    # differs from v1 in that this uses find_by_sql that returns an array of hashes as opposed to execute's PG object that can be plucked

    joins("JOIN (#{LAST_BOOK_QUERY3}) AS add ON add.id = #{table_name}.id")

    #=>
    # SELECT "books".* FROM "books" JOIN (SELECT t1.id FROM books t1 LEFT OUTER JOIN books t2 ON t1.author_id = t2.author_id AND ( (t1.published_on < t2.published_on) OR (t1.published_on = t2.published_on AND t1.id < t2.id) ) WHERE ( t2.author_id IS NULL )) AS add ON add.id = books.id

  }

  def by_bce_autor?
    author.bce?
  end

  def of_publisher?(publisher_n)
    publisher_name == publisher_n
  end

  def vampire_title?
    title.to_s.match?(%r'vamp[iy]re'i)
  end

  def with_characteristics?(characteristics_hash)
    author.name == characteristics_hash[:author_name] &&
      publisher.name == characteristics_hash[:publisher_name]
  end

  private
    def do_something
      ApplicationRecord.class
    end

end
