class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  before_action :logged_in_user, only: [:index, :show, :destroy]
  before_action :admin_user, only: [:index, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def user_index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '新規作成に成功しました。'
      if @user.admin?
        redirect_to user_index_user_path(user.id)
      else
        redirect_to @user
      end
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to root_path
    end
  end


  def correct_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

end
