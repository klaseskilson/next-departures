# frozen_string_literal: true

class DeparturesController < ApplicationController
  rescue_from 'StationInfo::NoDeparturesError', with: :redirect_to_not_found

  def show
    @departures = sl_data.departures
  end

  private

  def sl_data
    @_sl_data ||= StationInfo.find(station_id: params[:station_id])
  end
end
