class GeocoderRoutes < Application
  namespace '/v1' do
    post '/geocode' do
      result = Geocoder.geocode(params['city'])
      response.status = 200
      result.to_json
    end
  end
end
