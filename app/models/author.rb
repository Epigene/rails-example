# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  identifier :text             not null
#  name       :text             not null
#  dob        :date             not null
#

class Author < ApplicationRecord
  has_many :books
  has_many :publishers, through: :books
  has_many :genres, through: :books

  validates :identifier, presence: true, uniqueness: true
  validates :name, :dob, presence: true

  scope :with_book_count, -> {
    # This subquery join hack is needed so that AR allows pluck to work on custom-selected columns
    subquery =
      left_joins(:books). # NB, that this solution is only awailable in Rails5. Prior version may look to include some gem or use counter cache.
      select("authors.*, COUNT(books.id) AS book_count").
      group("authors.id").
      to_sql

    joins("JOIN (#{subquery}) as addendum ON addendum.id = #{table_name}.id")
  }

  scope :with_last_activity, -> {
    # This subquery join hack is needed so that AR allows pluck to work on custom-selected columns
    subquery =
      joins(:books).
      select("authors.*, MAX(books.published_on) AS last_activity").
      group("authors.id").
      to_sql

    joins("JOIN (#{subquery}) as add ON add.id = #{table_name}.id")
  }

  scope :order_by_last_activity, -> {
    with_last_activity.order("last_activity DESC")
  }
  scope :order_by_book_count, -> {
    with_book_count.order("book_count DESC")
  }
end
