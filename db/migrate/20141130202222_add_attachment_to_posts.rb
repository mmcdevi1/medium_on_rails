class AddAttachmentToPosts < ActiveRecord::Migration
  def change
    add_attachment :posts, :attachment
  end
end
