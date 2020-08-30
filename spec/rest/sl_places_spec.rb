# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SlPlaces do
  describe '.search' do
    subject { described_class.search(search_string: search_string) }

    before do
      stub_request(:get, 'https://api.sl.se/api2/typeahead.json?Key=missing&' \
                         "MaxResults=10&StationsOnly=true&SearchString=#{search_string}")
        .to_return(status: response[:status],
                   headers: { 'Content-Type' => 'application/json' },
                   body: File.open(Rails.root.join(*response[:fixture])))
    end

    context 'when searching for a station' do
      let(:search_string) { 'Hammarbyhöjden' }
      let(:response) { { status: 200, fixture: %w[spec support fixtures places_hammarbyhojden.json] } }

      it { is_expected.to all(include(name: be_a(String), site_id: be_a(String))) }
    end
  end
end
