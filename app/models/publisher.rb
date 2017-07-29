# == Schema Information
#
# Table name: publishers
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :text             not null
#

class Publisher < ApplicationRecord
  has_many :books
  has_many :authors, through: :books
  has_many :genres, through: :books

  validates :name, presence: true
end
