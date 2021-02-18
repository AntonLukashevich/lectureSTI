class LecturesController < ApplicationController
  before_action :set_lecture, only: %i[show edit update destroy]

  def index
    @lectures = Lecture.all
  end

  def new
    @lecture = Lecture.new
  end

  def show
  end

  def edit
  end

  def create
    @lecture = Lecture.new(lecture_params)

    if @lecture.save
      redirect_to @lecture
    else
      render 'new'
    end
  end

  def update
    if @lecture.update(lecture_params)
      redirect_to @lecture
    else
      render 'edit'
    end
  end

  def destroy
    @lecture.destroy
    redirect_to lectures_path
  end

  private

  def lecture_params
    params.require(:lecture).permit(:title, :description, :content)
  end

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end
end
