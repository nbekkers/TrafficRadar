class TrafficController < ApplicationController

  def index
    loc_ids = []
    if params[:location_ids]
      loc_ids = params[:location_ids].split(",")
    end

    @traffic = Traffic.find_for_last_hour(loc_ids)
    render :json => @traffic
  end

end
