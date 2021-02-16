class Lecture < ApplicationRecord
  has_many :lecture_blocks

  has_many :texts, class_name: 'TextContent'
  has_many :images, class_name: 'ImageContent'
  has_many :videos, class_name: 'VideoContent'
end
