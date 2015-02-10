class Tenant < ActiveRecord::Base

  has_many :generic_images, foreign_key: :generic_id, dependent: :destroy
  accepts_nested_attributes_for :generic_images

  validates :nombre, presence: true
  def self.created_today
    where('created_at >= ?', 1.day.ago)
  end

  def self.updated_today
    where('updated_at >= ? AND updated_at != created_at', 1.day.ago)
  end
end
