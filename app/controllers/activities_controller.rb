class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trip
  before_action :set_activity, only: %i[ show edit update destroy ]

  def show
  end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to trip_url(@activity.trip), notice: "Activity was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to trip_url(@activity.trip), notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy!

    respond_to do |format|
      format.html { redirect_to trip_url(params[:trip_id]), notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    def activity_params
      params.require(:activity).permit(:title, :address, :trip_id, :reference_number, :start_at, :end_at)
    end
end
