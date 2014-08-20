class MicropostsController < ApplicationController
  before_action :signed_id_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
  end

  def destroy
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
