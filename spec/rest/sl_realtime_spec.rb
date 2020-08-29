# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SlRealtime do
  describe '.departures' do
    subject { described_class.departures(station_id: station_id) }

    let(:station_id) { 9192 } # slussen

    before do
      fixture = %w[spec support fixtures realtime_9192.json]
      stub_request(:get, 'https://api.sl.se/api2/realtimedeparturesV4.json?' \
                         "SiteId=#{station_id}&TimeWindow=60&key=missing")
        .to_return(status: 200,
                   headers: { 'Content-Type' => 'application/json' },
                   body: File.open(Rails.root.join(*fixture)))
    end

    it('parses the response') { is_expected.to include(LatestUpdate: '2020-08-29T12:35:26') }
  end
end
