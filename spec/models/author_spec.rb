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

# spring rspec spec/models/author_spec.rb
RSpec.describe Author, type: :model do
  describe "Scopes" do
    describe ".order_by_last_activity" do
      context "when " do
        it " " do
          expect(0).to eq 1
        end
      end
    end

    describe ".order_by_book_count" do
      context "when " do
        it " " do
          expect(0).to eq 1
        end
      end
    end
  end

end
