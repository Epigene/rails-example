# rspec spec/setup_benchmark.rb
describe "Setup Benchmark" do

  describe "#new VS all others when testing Book#vampire_title?" do
    subject { book.vampire_title? }

    bout1_number_of = 200

    context "when setting up with #new" do
      bout1_number_of.times do
        let(:book) { Book.new(title: "Vampire Literature, a Historical Perspective") }

        it { is_expected.to eq(true) }
      end
    end

    context "when setting up with #instance_double" do
      let(:book) { instance_double("Book", vampire_title?: true) }

      bout1_number_of.times do
        it { is_expected.to eq(true) }
      end
    end

    context "when setting up with FactoryGirl.build_stubbed" do
      let(:book) { build_stubbed(:book, title: "Vampire Literature, a Historical Perspective") }

      bout1_number_of.times do
        it { is_expected.to eq(true) }
      end
    end

    context "when setting up with FactoryGirl.build" do
      let(:book) { build(:book, title: "Vampire Literature, a Historical Perspective") }

      bout1_number_of.times do
        it { is_expected.to eq(true) }
      end
    end

    context "when setting up with FactoryGirl.create" do
      let(:book) { create(:book, title: "Vampire Literature, a Historical Perspective") }

      bout1_number_of.times do
        it { is_expected.to eq(true) }
      end
    end
  end

  describe "#instance_double VS FactoryGirl.build_stubbed, FactoryGirl.build, and FactoryGirl.create" do
    subject { book.by_bce_autor? }

    bout2_number_of = 200

    context "when setting up with #instance_double" do
      let(:book) { build_stubbed(:book) }
      let(:author) { instance_double("Author", bce?: true) }

      before { allow(book).to receive(:author).and_return(author) }

      bout2_number_of.times do
        it { is_expected.to eq(true) }
      end
    end

    context "when setting up with FactoryGirl.build_stubbed" do
      let(:book) { build_stubbed(:book, :by_bce_author) }

      bout2_number_of.times do
        it { is_expected.to eq(true) }
      end
    end

    context "when setting up with FactoryGirl.build" do
      let(:book) { build(:book, :by_bce_author) }

      bout2_number_of.times do
        it { is_expected.to eq(true) }
      end
    end

    context "when setting up with FactoryGirl.create" do
      let(:book) { create(:book, :by_bce_author) }

      bout2_number_of.times do
        it { is_expected.to eq(true) }
      end
    end
  end

  describe "FactoryGirl.build_stubbed VS [FactoryGirl.build, FactoryGirl.create]" do
    subject { book.with_characteristics?(options) }

    let(:options) { {author_name: book.author.name, publisher_name: book.publisher.name} }

    bout3_number_of = 200

    context "when setting up with FactoryGirl.build_stubbed" do
      let(:book) { build_stubbed(:book) }

      bout3_number_of.times do
        it { is_expected.to eq(true) }
      end
    end

    context "when setting up with FactoryGirl.build" do
      let(:book) { build(:book) }

      bout3_number_of.times do
        it { is_expected.to eq(true) }
      end
    end

    context "when setting up with FactoryGirl.create" do
      let(:book) { create(:book) }

      bout3_number_of.times do
        it { is_expected.to eq(true) }
      end
    end
  end

  describe "FactoryGirl.build VS FactoryGirl.create" do
    subject { book.save! }

    bout4_number_of = 200

    context "when setting up with FactoryGirl.build" do
      let(:book) { build(:book) }

      bout4_number_of.times do
        it "triggers ApplicationRecord.class in callback" do
          expect(ApplicationRecord).to receive(:class).at_least(:once)

          subject
        end
      end
    end

    context "when setting up with FactoryGirl.create" do
      let(:book) { create(:book) }

      bout4_number_of.times do
        it "triggers ApplicationRecord.class in callback" do
          expect(ApplicationRecord).to receive(:class).at_least(:once)

          subject
        end
      end
    end
  end
end
