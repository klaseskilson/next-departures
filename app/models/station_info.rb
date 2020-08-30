# frozen_string_literal: true

class StationInfo
  def self.find(station_id:)
    new(SlRealtime.departures(station_id: station_id))
  end

  def initialize(sl_data)
    @departures = [*sl_data[:Metros], *sl_data[:Buses], *sl_data[:Trains], *sl_data[:Trams], *sl_data[:Boats]]
                  .compact
                  .map { |dep| Departure.new(**dep) }
                  .filter(&:expected_date_time)
                  .sort_by(&:expected_date_time)
  end

  attr_reader :departures
end
