# frozen_string_literal: true

# For details, see
# https://www.trafiklab.se/api/sl-platsuppslag/dokumentation
class SlPlaces
  include HTTParty
  base_uri 'https://api.sl.se/api2'
  default_params Key: Rails.configuration.sl_places_api_key,
                 MaxResults: 10,
                 StationsOnly: true

  # search for stations given a search string
  def self.search(search_string:)
    response = get('/typeahead.json', query: { SearchString: search_string })

    response['ResponseData'].map(&:deep_symbolize_keys) if response['StatusCode'].zero?
  end
end
