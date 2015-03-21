class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show

  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to new_course_lesson_path(@course), notice: 'Course was saved'
    else
      render "new", alert: 'It was not saved'
    end
  end


private
  def course_params
    params.require(:course).permit(:name, :category)
end
end
