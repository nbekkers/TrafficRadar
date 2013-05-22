class TrafficController < ApplicationController

  def index
    @traffic = Traffic.all
    render :json => @traffic
  end

end
