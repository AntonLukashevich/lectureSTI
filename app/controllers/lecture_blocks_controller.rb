require 'byebug'

class LectureBlocksController < ApplicationController
  #before_action :set_type

  def new
    #byebug
    @lecture = Lecture.find(params[:lecture_id])
    @lecture_block = LectureBlock.new
    @lecture_block.type = params[:type]
    @lecture_block.lecture_id = params[:lecture_id]
    case @lecture_block.type.to_s

    when 'TextContent'

      render 'text_contents/new'
    when 'ImageContent'
      #render 'image_content/new'
    when 'VideoContent'

    else
      puts "HHHHHHHEEEEEEEERRRRRRREEEEEE"

    end
  end

  def create
    @lecture = Lecture.find(params[:lecture_id])
    @lecture_block = @lecture.lecture_blocks.create(block_params)
  end

  private

  def block_params
    params.require(:lecture_block).permit(:title, :type, :order)
  end

  # def set_type
  #   @type = type
  # end
  #
  # def type
  #   LectureBlock.type.include?(params[:type]) ? params[:type] : "LectureBlock"
  # end
  #
  # def type_class
  #   type.constantize
  # end

  #
end
