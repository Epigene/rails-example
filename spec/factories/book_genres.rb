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

FactoryGirl.define do
  factory :book_genre do
    association :book
    association :genre

    trait :horror do
      genre { Genre.find_by(identifier: "horror") || create(:genre, identifier: "horror") }
    end
  end
end
