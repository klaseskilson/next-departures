# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe 'GET /search' do
    before do
      expect(SlPlaces).to receive(:search).with(search_string: search_term).and_return(search_results)
      get show_search_path, params: { station: search_term }
    end

    context 'when searching for slussen' do
      let(:search_term) { 'slussen' }
      let(:search_results) { [{ name: 'Slussen', site_id: '9192' }] }

      it 'works!' do
        expect(response).to have_http_status(:ok)
        expect(response.body).to include 'Slussen'
      end
    end

    context 'when searching for "there is no way this will find anything"' do
      let(:search_term) { 'there is no way this will find anything' }
      let(:search_results) { [] }

      it 'says nothing was found' do
        expect(response).to have_http_status(:ok)
        expect(response.body).to include 'Nothing found'
      end
    end
  end
end
