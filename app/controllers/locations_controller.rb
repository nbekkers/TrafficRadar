require 'locations_to_hash_converter'

class LocationsController < ApplicationController
  def index
    converter = LocationsToHashConverter.new
    render :json => converter.convert(Location.all)
  end
end
