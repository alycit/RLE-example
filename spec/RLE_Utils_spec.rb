require_relative '../lib/RLE_Utils'

describe 'RLE_Utils' do
  context '#expand' do

    context 'with default length' do
      let(:basic_result) { ["W", "W", "W", "W", "B", "B", "B", "B", "B", "B", "B", "B", "W", "W", "W", "W"] }

      it 'expands a string into an Array of data' do
        result = RLE_Utils.expand("4W8B4W4W8B4W")
        expect(result.first).to be_a(Array)
      end

      it 'expands a string into 2 rows of a base length' do
        result = RLE_Utils.expand("4W8B4W4W8B4W")
        expect(result.length).to eq(2)
        expect(result.first.length).to eq(RLE_Utils::BASE_LINE_LENGTH)
      end

      it 'expands a string into a 2d structure of equivalent data' do
        result = RLE_Utils.expand("4W8B4W4W8B4W")
        expect(result.first).to eq(basic_result)
        expect(result.last).to eq(basic_result)
      end
    end

    context 'with a given length' do
      it 'expands a string into rows of the given length' do
        result = RLE_Utils.expand("1W2B1W", 4)
        expect(result.length).to eq(1)
        expect(result.first.length).to eq(4)
      end
    end
  end
end
