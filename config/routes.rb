# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'searches#index'
  get '/departures/:station_id', to: 'departures#show'
end
