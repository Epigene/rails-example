# == Schema Information
#
# Table name: book_genres
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer          not null
#  genre_id   :integer          not null
#

class BookGenre < ApplicationRecord
  belongs_to :book
  belongs_to :genre

  validates :book, :book_id, :genre, :genre_id, presence: true
  validates :genre_id, uniqueness: {scope: [:book_id]}
end
