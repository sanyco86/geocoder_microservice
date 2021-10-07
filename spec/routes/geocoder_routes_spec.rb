RSpec.describe GeocoderRoutes, type: :routes do
  describe 'valid request' do
    let(:city) { 'Москва' }

    it 'returns coordinates' do
      do_request city: city

      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq('[55.7540471,37.620405]')
    end
  end

  describe 'invalid request' do
    let(:city) { 'Саранск' }

    it 'returns invalid result' do
      do_request city: city

      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq('null')
    end
  end

  def do_request(params={})
    post '/v1/geocode', params
  end
end
