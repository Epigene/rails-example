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

FactoryGirl.define do
  factory :author do
    sequence(:identifier, 1) { |i| "Author#{i}" }
    sequence(:name, 1) { |i| "Pen name #{i}" }
    dob  { 28.years.ago.to_date }
  end
end
