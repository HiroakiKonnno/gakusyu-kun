class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :edit_learner_info, :update_learner_info]
  before_action :logged_in_user, only: [:index, :show, :destroy, :edit_learner_info, :update_learner_info]
  before_action :admin_user, only: [:index, :destroy, :edit_learner_info, :update_learner_info]

  def show
    @user = User.find(params[:id])
  end

  def index
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
        redirect_to users_path
      else
        redirect_to @user
      end
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def edit_learner_info
  end

  def update_learner_info
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
    else
      flash[:danger] = "ユーザー情報を更新できませんでした。"
    end
    redirect_to user_index_user_path
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
