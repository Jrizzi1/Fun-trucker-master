class RalliesController < ApplicationController
  layout 'public'

  def show
    @rally = Rally.where(slug: params[:truck_slug]).first

    if @rally.present?
      render :show
    else
      render :file => "#{Rails.root}/public/404", :layout => false, status: 404
    end
  end
end
