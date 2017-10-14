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
    def author_set_up_1
      @author1 = create(:author, :with_two_books).reload
      @author2 = create(:author).reload
      @author3 = create(:author, :with_one_book).reload
    end

    def author_set_up_2
      oldie = create(:book, published_on: "2000-01-01".to_date)
      @author2 = create(:book, published_on: "2000-02-01".to_date).author
      @author1 = create(:book, published_on: "2003-01-01".to_date, author: oldie.author).author
      @author3 = create(:book, published_on: "2017-07-29".to_date).author
    end

    describe ".order_by_last_activity" do
      subject { described_class.order_by_last_activity }

      context "when called with a DB contents of situation 2" do
        before { author_set_up_2 }

        it "orders the three authors correctly" do
          expect(subject.pluck(:id)).to eq([@author3.id, @author1.id, @author2.id])
        end
      end
    end

    describe ".order_by_book_count" do
      subject { described_class.order_by_book_count }

      context "when called with a DB contents of situation 1" do
        before { author_set_up_1 }

        it "orders the three authors correctly" do
          expect(subject.pluck(:id)).to eq([@author1.id, @author3.id, @author2.id])
        end
      end
    end
  end

  describe "#bce?" do
    subject { author.bce? }

    context "when called on an author with :dob before current era" do
      let(:author) { Author.new(dob: "January 8, 99 BC".to_date) }

      it { is_expected.to eq(true) }
    end

    context "when called on an author with :dob in current era" do
      let(:author) { Author.new(dob: "0-01-01".to_date) }

      it { is_expected.to eq(false) }
    end
  end

end
