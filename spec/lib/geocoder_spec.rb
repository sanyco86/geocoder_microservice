require_relative '../../app/lib/geocoder'

RSpec.describe Geocoder do
  subject { described_class }

  before { stub_const("#{described_class}::DATA_PATH", "spec/fixtures/city.csv") }

  describe '.geocode' do
    context 'existing city' do
      it 'returns coordinates' do
        result = subject.geocode('Москва')

        expect(result).to eq([55.7540471, 37.620405])
      end
    end

    context 'missing city' do
      it 'returns a nil value' do
        result = subject.geocode('Missing')

        expect(result).to be_nil
      end
    end
  end
end
