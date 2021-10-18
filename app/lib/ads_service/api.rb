# frozen_string_literal: true

module AdsService
  module Api
    def update_coordinates(id, coordinates)
      coordinates = { lat: coordinates[0], lon: coordinates[1] }
      connection.patch("ads/#{id}") do |request|
        request.params = { coordinates: coordinates }
      end
    end
  end
end
