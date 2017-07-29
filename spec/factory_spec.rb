# spring rspec spec/factory_spec.rb
RSpec.describe "Factories" do
  subject { build_stubbed(factory) }

  %i|author book_genre book genre publisher|.each do |factory|
    it "#{factory} factory is valid" do
      expect(build_stubbed(factory)).to be_valid
    end
  end

end
