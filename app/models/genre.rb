# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  identifier :text             not null
#

class Genre < ApplicationRecord
  has_many :book_genres
  has_many :books, through: :book_genres

  validates :identifier, presence: true, uniqueness: true, format: { with: /\A[a-z0-9\-_]+\z/, message: :unsupported_identifier }
end
