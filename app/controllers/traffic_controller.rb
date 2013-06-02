require 'converters/traffic_to_hash_converter'

class TrafficController < ApplicationController

  def index
    loc_ids = []

    if params[:location_ids]
      loc_ids = params[:location_ids].split(",")
    end

    render :json => TrafficToHashConverter.new.parse(Traffic.find_for_last_hour(loc_ids))
  end

end
