class Image < ApplicationRecord
    belongs_to :imageable, :polymorphic => true
    # validates :image, presence: true

    # attachment :file
#     has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
#   validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
