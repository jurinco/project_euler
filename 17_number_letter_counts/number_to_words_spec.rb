require_relative 'number_to_words'

describe 'number_to_words' do
  it 'returns the correct results' do
    expect(number_to_words(342)).to eql('three hundred and forty two')
    expect(number_to_words(115)).to eql('one hundred and fifteen')
  end
end
