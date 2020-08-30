# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Departure do
  subject { described_class.new(input) }

  let(:input) do
    { GroupOfLine: 'tunnelbanans röda linje', DisplayTime: '10:39',
      TransportMode: 'METRO', LineNumber: '13', Destination: 'Norsborg',
      JourneyDirection: 2, StopAreaName: 'Slussen', StopAreaNumber: 1011,
      StopPointNumber: 2012, StopPointDesignation: '3',
      TimeTabledDateTime: '2020-08-30T10:39:09',
      ExpectedDateTime: '2020-08-30T10:48:11', JourneyNumber: 28_362,
      Deviations: [{ Text: 'Inställd', Consequence: 'CANCELLED', ImportanceLevel: 0 }] }
  end
  let(:attributes) do
    input.excluding(:ExpectedDateTime, :TimeTabledDateTime)
         .transform_keys { |key| key.to_s.underscore.to_sym }
  end

  it do
    expect(subject).to have_attributes(**attributes,
                                       time_tabled_date_time: be_a(ActiveSupport::TimeWithZone),
                                       expected_date_time: be_a(ActiveSupport::TimeWithZone))
  end
end
