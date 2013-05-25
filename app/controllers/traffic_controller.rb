class TrafficController < ApplicationController

  def index
    @traffic = Traffic.where(:location_id => params[:location_ids])
    render :json => @traffic
  end

end
