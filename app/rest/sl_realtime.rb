# frozen_string_literal: true

# For details, see
# https://www.trafiklab.se/node/15754/documentation
class SlRealtime
  include HTTParty
  base_uri 'https://api.sl.se/api2'
  default_params key: Rails.configuration.sl_realtime_api_key,
                 TimeWindow: 60

  # get departures for a given station id
  def self.departures(station_id:)
    response = get('/realtimedeparturesV4.json', query: { SiteId: station_id })

    response['ResponseData'].deep_symbolize_keys if response['StatusCode'].zero?
  end
end
