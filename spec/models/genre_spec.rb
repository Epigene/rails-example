# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  identifier :text             not null
#

# spring rspec spec/models/genre_spec.rb
RSpec.describe Genre, type: :model do
end
