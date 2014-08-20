class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
    else
      flash[:error] = "Failed to create Micropost."
    end

    if request.referer
      redirect_to(:back)
    else
      redirect_to root_url
    end
  end

  def destroy
    @micropost.destroy
    redirect_to current_user
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end

    # ----- before actions -----
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
