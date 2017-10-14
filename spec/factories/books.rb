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

FactoryGirl.define do
  factory :book do
    sequence(:identifier, 1) { |i| "Book#{i}" }
    association :publisher
    association :author
    sequence(:title, 1) { |i| "Book title #{i}" }
    published_on { "2000-05-05".to_date }

    #== traits below ==

    trait :horror do
      after(:create) do |book|
        create(:book_genre, :horror, book_id: book.id)
      end
    end

    trait :by_bce_author do
      author { create(:author, :bce_dob) }
    end

  end
end
