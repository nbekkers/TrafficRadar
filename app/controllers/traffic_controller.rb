class TrafficController < ApplicationController

  def index
    @traffic = Traffic.find_for_last_hour(params[:location_ids])
    render :json => @traffic
  end

end
