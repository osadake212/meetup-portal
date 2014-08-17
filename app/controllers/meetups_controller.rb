class MeetupsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @meetups = Meetup.paginate(page: params[:page], per_page: 5).order('start_date DESC')
  end

  def show
    @meetup = Meetup.find(params[:id])
  end

  def new
    @meetup = Meetup.new(start_date: DateTime.now, end_date: DateTime.now + 1.hour)
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
    if @meetup.update_attributes(meetup_params)
      flash[:success] = "Meetup updated!"
      redirect_to @meetup
    else
      render 'edit'
    end
  end

  def destroy
    Meetup.find(params[:id]).destroy
    flash[:success] = "The Meetup destroyed."
    redirect_to meetups_url
  end

  private
    def meetup_params
      params.require(:meetup).permit(:title, :short_description, :description, :start_date, :end_date)
    end

    # ----- before actions -----
    def correct_user
      @meetup = current_user.meetups.find_by(id: params[:id])
      redirect_to root_url if @meetup.nil?
    end

end
