require 'core_ext/actionpack/lib/action_controller/metal/strong_parameters'

class LocationsController < ApplicationController
  ActionController::Parameters.include(Parameters::Location)

  def index
    set_locations_with_box if params.corners?
    set_locations if params.gps?
    respond_to do |format|
      format.html
      format.json do 
        decorate_locations
        render json: @locations, status: 200, location: locations_path 
      end
    end
  end
  
  private
  def set_locations
    distance = params[:distance] || 70
    @locations = Location.near(params.gps, distance, units: :km)
    @locations = Location.near(
      params.gps, 1000, units: :km
    ) if find_locations?
    to_update = @locations.where(with_forecast: false).limit(8)
    @locations = @locations.where(with_forecast: true).limit(8)
    to_update.each { |location| location.set_job } if to_update.present?
  end

  def find_locations?
    params[:distance].nil? && @locations.empty?
  end

  def set_locations_with_box
    @locations = Location.within_bounding_box(params.corners)
      .limit(params[:limit])
  end

  def decorate_locations
    options = params.gps? ? { params: { gps: params.gps } } : {}
    @locations = @locations.map do |location| 
      LocationSerializer.new(location, options)
        .serializable_hash[:data][:attributes]
    end
  end
end
