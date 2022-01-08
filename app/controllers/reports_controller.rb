class ReportsController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @report = Report.find(params[:id])
  end

  def show_manager
    @user = User.find(params[:user_id])
    @report = Report.find(params[:id])
  end

  def update_show_manager
    @report = Report.find(params[:id])
    if @report.update(report_manager_edit params)
      flash[:success] = "コメントを更新しました。"
    else
      flash[:danger] = "コメントを更新できませんでした。"
    end
    redirect_to user_reports_path
  end

  def index
    @user = User.find(params[:user_id])
    @reports = @user.reports.paginate(page: params[:page])
  end

  def new
    @user = User.find(params[:user_id])
    @report = Report.new
  end

  def create
    @report = Report.new(report params)
    if @report.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to user_reports_url
    else
      flash[:danger] = '新規作成に失敗しました。'
      redirect_to user_reports_url
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    flash[:success] = "#{@report.reported_day.strftime("%Y-%m-%d")}のデータを削除しました。"
    redirect_to user_reports_path
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_edit params)
      flash[:success] = "日報を更新しました。"
    else
      flash[:danger] = "日報を更新できませんでした。"
    end
    redirect_to user_reports_path
  end

  private

  def report params
    params.require(:report).permit(:reported_day, :note, :study_time, :user_id)
  end

  def report_edit params
    params.require(:report).permit(:reported_day, :note, :study_time)
  end

  def report_manager_edit params
    params.require(:report).permit(:comment, :confiramtion)
  end
end
