class TrucksController < ApplicationController
  layout 'public'

  def show
    
    @truck = Truck.where(slug: params[:truck_slug]).first

    if @truck.present?
      render :show
    else
      @rally = Rally.where(slug: params[:truck_slug]).first

       if @rally.present?
          render "rallies/show"
      else
          render :file => "#{Rails.root}/public/404", :layout => false, status: 404
      end

    end
  end
end

