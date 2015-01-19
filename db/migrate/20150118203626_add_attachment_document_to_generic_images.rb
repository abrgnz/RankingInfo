class AddAttachmentDocumentToGenericImages < ActiveRecord::Migration
  def self.up
    change_table :generic_images do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :generic_images, :document
  end
end
