# frozen_string_literal: true
class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]
  before_action :course_params, only: [:create, :update]

  def index
    @courses = Course.all
  end

  def show; end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to(courses_path)
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @course.update(course_params)
      redirect_to(courses_path)
    else
      render "edit"
    end
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description)
  end
end