class MeetupsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @meetups = Meetup.all
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = current_user.meetups.build(meetup_params)
    if @meetup.save
      flash[:success] = "Meetup created!"
      redirect_to meetups_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    Meetup.find(params[:id]).destroy
    flash[:success] = "The Meetup destroyed."
    redirect_to meetups_url
  end

  private
    def meetup_params
      params.require(:meetup).permit(:title, :description, :format, :date, :start_time, :end_time)
    end

end
