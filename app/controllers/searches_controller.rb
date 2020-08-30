# frozen_string_literal: true

class SearchesController < ApplicationController
  def new; end

  def show
    @results = find(params.require(:station))
  end

  private

  def find(search_term)
    Rails.cache.fetch("station-search-#{search_term}", expires_in: 7.days) do
      SlPlaces.search(search_string: search_term)
    end
  end
end
