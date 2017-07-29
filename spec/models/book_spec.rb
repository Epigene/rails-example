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
#

# spring rspec spec/models/book_spec.rb
RSpec.describe Book, type: :model do
  def book_set_up_1
    Book.delete_all
    # setup
    # author 1
      @last1 = create(:book, published_on: "2017-07-29".to_date)
      create(:book, published_on: "2001-07-29".to_date, author: @last1.author)
    # author 2
      @last2 = create(:book, published_on: "2016-07-29".to_date)
      create(:book, published_on: "2001-11-29".to_date, author: @last2.author)
  end

  describe "Scopes" do
    describe ".authors_last_books" do
      subject { described_class.authors_last_books }

      context "when called with database contents 1" do
        before do
          book_set_up_1
        end

        it "collects the two books that are their author's last books based on publishing date" do
          expect(subject.pluck("books.id")).to contain_exactly(@last1.id, @last2.id)
        end
      end
    end

    describe ".authors_last_books2" do
      subject { described_class.authors_last_books2 }

      context "when called with database contents 1" do
        before do
          book_set_up_1
        end

        it "collects the two books that are their author's last books based on publishing date" do
          expect(subject.pluck("books.id")).to contain_exactly(@last1.id, @last2.id)
        end
      end
    end

    describe ".authors_last_books3" do
      subject { described_class.authors_last_books3 }

      context "when called with database contents 1" do
        before do
          book_set_up_1
        end

        it "collects the two books that are their author's last books based on publishing date" do
          expect(subject.pluck("books.id")).to contain_exactly(@last1.id, @last2.id)
        end
      end
    end
  end

end
