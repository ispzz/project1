class Post < ApplicationRecord
  belongs_to :user, :optional => true
  # validate :message_or_image_required
  #
  # def message_or_image_required
  #   unless message.present? || image.present?
  #     errors.add(:base, "Must include a message or an image")
  #   end
  # end

end
