class HomeController < ApplicationController

  def index
    @surveys = Survey.where(public_display: true)
  end

    def no_auth; end
end
