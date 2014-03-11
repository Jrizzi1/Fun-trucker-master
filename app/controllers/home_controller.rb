class HomeController < ApplicationController
  layout 'public'

  def index
    @trucks = Truck.all
    @rallies = Rally.all
  end
end

