class TextContentsController < ApplicationController
  before_action :set_text, only: %i[show edit update destroy]

  def index
    @lecture = Lecture.find(params[:lecture_id])
    @text_contents = @lecture.text_contents
  end

  def new
    #byebug
    @lecture = Lecture.find(params[:lecture_id])
    @text_content = TextContent.new
  end

  def show
  end

  def edit
  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @text_content = @lecture.text_contents.create(text_params)

    if @text_content.save
      redirect_to @lecture
    else
      render 'new'
    end
  end

  def update
    if @text_content.update(text_params)
      redirect_to @lecture
    else
      render 'edit'
    end
  end

  def destroy
    @text_content.destroy
    redirect_to lecture_path(@lecture)
  end


  private

  def text_params
    params.require(:text_content).permit(:text_content, :title, :order, :type).merge!(type: "TextContent")
  end

  def set_text
    @lecture = Lecture.find(params[:lecture_id])
    @text_content = @lecture.text_contents.find(params[:id])
  end
end
