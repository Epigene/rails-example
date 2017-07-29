# == Schema Information
#
# Table name: publishers
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :text             not null
#

FactoryGirl.define do
  factory :publisher do
    sequence(:name, 1) { |i| "Publisher#{i}" }
  end
end
