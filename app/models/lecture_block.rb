class LectureBlock < ApplicationRecord
  belongs_to :lecture

  scope :texts, -> {where(type: 'TextContent')}
  scope :images, -> {where(type: 'ImageContent')}
  scope :videos, -> {where(type: 'VideoContent')}


end
