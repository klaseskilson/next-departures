# frozen_string_literal: true

Rails.application.config.tap do |c|
  c.x.sl.places_api_key = ENV['SL_PLACES_API_KEY']
  c.x.sl.realtime_api_key = ENV['SL_REALTIME_API_KEY']
end
