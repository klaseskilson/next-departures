# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'searches#new'
  get '/search', to: 'searches#show', as: :show_search
  get '/departures/:station_id', to: 'departures#show', as: :show_departures
end
