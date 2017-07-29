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

# spring rspec spec/models/book_genre_spec.rb
RSpec.describe BookGenre, type: :model do
end
