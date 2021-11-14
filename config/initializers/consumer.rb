require 'json'

channel = RabbitMq.consumer_channel
queue = channel.queue('geocoding', durable: true)

queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
  Thread.current[:request_id] = properties.headers['request_id']

  payload = JSON(payload)
  coordinates = Geocoder.geocode(payload['city'])

  Application.logger.info('geocoded coordinates', city: payload['city'], coordinates: coordinates)

  unless coordinates.blank?
    Metrics.geocoding_requests_total.increment(labels: {result: 'success'})
    client = AdsService::Client.new

    Metrics.geocoder_request_duration_seconds.observe(
      Benchmark.realtime { client.update_coordinates(payload['id'], coordinates) },
      labels: { service: 'geocoding' }
    )
  else
    Metrics.geocoding_requests_total.increment(labels: {result: 'failure'})
  end

  channel.ack(delivery_info.delivery_tag)
end
