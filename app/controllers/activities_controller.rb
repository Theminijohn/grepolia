class ActivitiesController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @activities = PublicActivity::Activity.where(recipient: current_user).order("created_at desc")
  end

end
