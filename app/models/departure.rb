# frozen_string_literal: true

class Departure
  def initialize(**dep)
    @expected_date_time = dep.delete(:ExpectedDateTime)&.in_time_zone('Europe/Stockholm')
    @time_tabled_date_time = dep.delete(:TimeTabledDateTime)&.in_time_zone('Europe/Stockholm')

    dep.each do |key, value|
      instance_variable_set("@#{key.to_s.underscore}", value)
    end
  end

  # These could also be dynamically defined, but kept here for ease of use
  attr_reader :destination, :deviations, :display_time, :expected_date_time,
              :group_of_line, :journey_direction, :journey_number, :line_number,
              :stop_area_name, :stop_area_number, :stop_point_designation,
              :stop_point_number, :time_tabled_date_time, :transport_mode
end
