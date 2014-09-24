require_relative 'max_path_sum'

describe 'max_path_sum' do
  before :each do
    @data = [[3],[7,4],[2,4,6],[8,5,9,3]]
  end

  it 'returns the correct result' do
    expect(max_path_sum(@data)).to eql(23)
  end
end
