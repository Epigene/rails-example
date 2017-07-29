# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  identifier :text             not null
#

FactoryGirl.define do
  factory :genre do
    sequence(:identifier, 1) { |i| "genre#{i}" }
  end
end
