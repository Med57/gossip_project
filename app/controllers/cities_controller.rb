class CitiesController < ApplicationController
  def show
    @city = City.where(name: params[:id])
    @user = User.where(city_id: @city.ids)
    @gossips = Gossip.where(user: @user.ids)
  end

end
