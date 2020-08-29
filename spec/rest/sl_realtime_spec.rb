# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SlRealtime do
  describe '.departures' do
    subject { described_class.departures(station_id: station_id) }

    before do
      stub_request(:get, 'https://api.sl.se/api2/realtimedeparturesV4.json?' \
                         "SiteId=#{station_id}&TimeWindow=60&key=missing")
        .to_return(status: response[:status],
                   headers: { 'Content-Type' => 'application/json' },
                   body: File.open(Rails.root.join(*response[:fixture])))
    end

    context 'when using the Slussen staition id' do
      let(:station_id) { 9192 }
      let(:response) { { status: 200, fixture: %w[spec support fixtures realtime_9192.json] } }

      it('parses the response') { is_expected.to include(LatestUpdate: '2020-08-29T12:35:26') }
    end

    context 'when using a non-existing station id' do
      let(:station_id) { 'wrong' }
      let(:response) { { status: 422, fixture: %w[spec support fixtures realtime_error.json] } }

      it { is_expected.to be_nil }
    end
  end
end
