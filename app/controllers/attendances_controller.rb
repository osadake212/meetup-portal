class AttendancesController < ApplicationController
  before_action :signed_in_user

  def create
    @meetup = Meetup.find(params[:attendance][:meetup_id])
    current_user.attend_meetup!(@meetup)
    respond_to do |format|
      format.html { redirect_to @meetup }
      format.js
    end
  end

  def destroy
    @meetup = Attendance.find(params[:id]).meetup
    current_user.cancel_meetup!(@meetup)
    respond_to do |format|
      format.html { redirect_to @meetup }
      format.js
    end
  end
end
