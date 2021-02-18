class Lecture < ApplicationRecord
  #has_many :lecture_blocks
  has_rich_text :content

  has_many :text_contents, class_name: 'TextContent'
  has_many :image_contents, class_name: 'ImageContent'
  has_many :video_contents, class_name: 'VideoContent'
end
