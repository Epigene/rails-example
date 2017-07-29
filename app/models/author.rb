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

  scope :order_by_last_activity, -> {
    where(attribute: argument)
  }
  scope :order_by_book_count, -> {
    where(attribute: argument)
  }
end
