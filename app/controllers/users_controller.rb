class UsersController < ApplicationController
  def update
    user = User.find(current_user.id)
    if user.vsc_address.present?
      redirect_to root_url, notice: "Already exists."
    end
    respond_to do |format|
      if user_params[:vsc_address].present?
    if user.update(user_params)
        format.html { redirect_to root_url, notice: "Welcome to AnimeBNB!" }
        format.json { render :show, status: :ok, location: user }
      end
    else
      format.html { redirect_to root_url, notice: "Blank entity" }
      format.json { render json: user.errors, status: :unprocessable_entity }
    end
    end
  end
private
  def user_params
      params.require(:user).permit(:vsc_address, :user_level)
  end

end
