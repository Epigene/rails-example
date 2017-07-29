# == Schema Information
#
# Table name: publishers
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :text             not null
#

# spring rspec spec/models/publisher_spec.rb
RSpec.describe Publisher, type: :model do
end
