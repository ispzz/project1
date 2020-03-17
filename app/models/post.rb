class Post < ApplicationRecord
  belongs_to :user, :optional => true
  validate :message_or_image_required

  # def message_or_image_required
  #   if message.blank? || image.blank?
  #     flash[:alert] = "Need to include an image or message."
  #   end
  # end

  def message_or_image_required
    if message.blank?
      errors.add(:message, "Must include a message")
    elsif image.blank?
      errors.add(:image, "Must include an image")
    end
  end

end
