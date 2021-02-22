require 'byebug'

class LectureBlocksController < ApplicationController
  before_action :set_block,  only: %i[show edit update destroy]

  def index
    @lecture = Lecture.find(params[:lecture_id])
    @lecture_blocks = @lecture.lecture_blocks.order(order: :asc)
    @lecture_block.sort_by(:order)

  end

  def new
    @lecture = Lecture.find(params[:lecture_id])
    @lecture_block = LectureBlock.new
    #@lecture_block = @lecture.build_lecture_block(block_params)
  end


  def show

  end

  def edit
  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    #@lecture_block = @lecture.lecture_blocks.create(block_params)
    @lecture_block = @lecture.build_lecture_block(block_params)
    if @lecture_block.save
      redirect_to @lecture
    else
      render 'new'
    end
  end

  def update
    if @lecture_block.update(block_params)
      redirect_to @lecture
    else
      render 'edit'
    end
  end

  def destroy
    @lecture_block.destroy
    redirect_to lecture_path(@lecture)
  end

  private

  def block_params
    params.require(:lecture_block).permit(:title, :type, :order, :content)
  end

  def set_block
    #binding.pry
    @lecture = Lecture.find(params[:lecture_id])
    @lecture_block = @lecture.lecture_blocks.find(params[:id])
    #.with_rich_text_content_and_embeds
  end

end
