class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    logger.debug("############create(params[:id]) :   ")
    logger.debug(params[:micropost_id])
    logger.debug("     ")
    
    micropost = Micropost.find(params[:micropost_id])
    current_user.likeon(micropost)
    flash[:success] = 'お気に入り登録しました。'
    redirect_to root_path
  end

  def destroy
    logger.debug("############destroy(params[:id]) :   ")
    logger.debug(params[:micropost_id])
    logger.debug("     ")
    
    micropost = Micropost.find(params[:micropost_id])
    current_user.likeoff(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_path
  end
end
