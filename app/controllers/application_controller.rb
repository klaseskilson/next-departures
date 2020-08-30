# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def redirect_to_not_found(_exception)
    redirect_to('/404.html')
  end
end
