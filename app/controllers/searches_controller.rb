class SearchesController < ApplicationController

  def search
  end

  def friends
    foursquare = FoursquareService.new
    @friends = foursquare.friends(session[:token])
  end

  def foursquare
    foursquare = FoursquareService.new
    body = foursquare.searchVenues(ENV['FOURSQUARE_CLIENT_ID'], ENV['FOURSQUARE_SECRET'], params[:zipcode])

    if body.class == Array
      @venues = body
    else
      @error = body
    end
    render 'search'
    
  end
end
