class LectureBlock < ApplicationRecord
  belongs_to :lecture

  has_rich_text :content

  # scope :text_contents, -> { where(type: 'TextContent') }
  # scope :image_contents, -> { where(type: 'ImageContent') }
  # scope :video_contents, -> { where(type: 'VideoContent') }
end