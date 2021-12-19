class LessonsController < ApplicationController
  def show
  end

    
  def index
    @lessons = Lesson.all
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:success] = "#{@lesson.lesson_name}のデータを削除しました。"
    redirect_to lessons_url
  end

end
