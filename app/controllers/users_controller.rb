class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :edit_learner_info, :update_learner_info]
  before_action :logged_in_user, only: [:index, :show, :destroy, :edit_learner_info, :update_learner_info, :user_lesson]
  before_action :admin_user, only: [:index, :destroy, :edit_learner_info, :update_learner_info]
  before_action :personal_user, only: [:user_lesson]
  before_action :correct_user, only: [:show]
  

  def show
    @user = User.find(params[:id])
    @userlessons = Userlesson.where(user_id: @user.id)
  end

  def user_lesson
    @user = User.find(params[:user_id])
    @lesson = Lesson.find(params[:id])
    @taskcomp = @lesson.tasks.where.not(completed_day: nil).count
    @tasknum = @lesson.tasks.all.count
    @percent = (@taskcomp.to_f / @tasknum.to_f)*100
    @lesson.month = if params["month(1i)"]
      DateTime.new(
        params["month(1i)"].to_i,
        params["month(2i)"].to_i,
        params["month(3i)"].to_i
      )
    else
      Time.now.strftime("%Y-%m-%d")
    end
    @reports = @user.reports.where(user_id: @user.id).where('cast(reported_day as text) Like?', "%#{@lesson.month.strftime("%Y-%m")}%").order(reported_day: "ASC")
  end

  def user_lesson_index
    @user = User.find(params[:user_id])
    @lesson = Lesson.find(params[:id])
    @tasks = @lesson.tasks
  end

  def user_task_update
    time_params.each do|id, item|
      task = Task.find(id)
      task.update(item)
    end
    flash[:success] = "更新しました。"
    redirect_to users_user_id_lessons_id_path(id: params[:lesson][:id], user_id: params[:lesson][:user_id])
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
        redirect_to users_path
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

  def time_params
    params.require(:lesson).permit(tasks: [:planed_day, :completed_day])[:tasks]
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
    redirect_to(root_url) unless current_user?(@user)|| current_user.admin?
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def personal_user
    redirect_to root_url unless current_user?(User.find(params[:user_id])) || current_user.admin?
  end

end
