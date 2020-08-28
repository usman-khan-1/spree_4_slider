class Spree::Slide < ActiveRecord::Base

  has_and_belongs_to_many :slide_locations,
    class_name: 'Spree::SlideLocation',
    join_table: 'spree_slide_slide_locations'

  validate :check_attachment_presence
  validate :check_attachment_content_type

  has_one_attached :image

  scope :published, -> { where(published: true).order('position ASC') }
  scope :location, -> (location) { joins(:slide_locations).where('spree_slide_locations.name = ?', location) }


  def initialize(attrs = nil)
    attrs ||= { published: true }
    super
  end

  def slide_name
    name.blank? && product.present? ? product.name : name
  end

  def slide_link
    link_url.blank? && product.present? ? product : link_url
  end

  def slide_image
    !image.file? && product.present? && product.images.any? ? product.images.first : image
  end

  def accepted_image_types
    %w(image/jpeg image/jpg image/png image/gif)
  end

  def check_attachment_presence
    unless image.attached?
      errors.add(:image, :image_must_be_present)
    end
  end

  def check_attachment_content_type
    if image.attached? && !image.content_type.in?(accepted_image_types)
      errors.add(:image, :not_allowed_content_type)
    end
  end
end
