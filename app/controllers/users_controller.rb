class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def index
  end

  def show
    @user = User.find(current_user.id)
  end

  def edit
  end

  def update
    @user.update_without_current_password(user_params)
    redirect_to mypage_users_url
  end

  def mypage
  end

  def edit_address
  end

  def update_password
    if password_set?
      @user.update_password(user_params) 
      flash[:notice] = "パスワードは正しく更新されました。"
      redirect_to mypage_edit_password_users_url
    else
      @user.errors.add(:password, "パスワードに不備があります。")
      render "edit_password"
    end
  end

  def edit_password
  end

  def favorite
    @favorites = @user.likees(Product)
  end

   private
    def user_params
      params.require(:user).permit(:user_name)
    end

    def set_user
      @user = current_user
    end

    def password_set?
      user_params[:password].present? && user_params[:password_confirmation].present? ?
      true : false
    end
end
