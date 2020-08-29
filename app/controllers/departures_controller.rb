# frozen_string_literal: true

class DeparturesController < ApplicationController
  def show
    @departures = departures
    @station_info = station_info
  end

  private

  def sl_data
    @_sl_data ||= ::SlRealtime.departures(station_id: params[:station_id])
  end

  def station_info
    sl_data[:StopPointDeviations]
  end

  # TODO: parse time before
  # TODO: wrap in app value
  def departures
    [*sl_data[:Metros], *sl_data[:Buses], *sl_data[:Trains], *sl_data[:Trams], *sl_data[:Boats]]
      .compact
      .filter { |dep| dep[:ExpectedDateTime] }
      .sort_by! { |dep| dep[:ExpectedDateTime].in_time_zone('Europe/Stockholm') }
  end
end
