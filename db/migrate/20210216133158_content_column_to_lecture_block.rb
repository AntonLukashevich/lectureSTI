class ContentColumnToLectureBlock < ActiveRecord::Migration[6.1]
  def up
    add_column :lecture_blocks, :text_content, :text
    add_column :lecture_blocks, :image_content, :string
    add_column :lecture_blocks, :video_content, :string
  end

  def down
    remove_column :lecture_blocks, :text_content
    remove_column :lecture_blocks, :image_content
    remove_column :lecture_blocks, :video_content
  end
end
