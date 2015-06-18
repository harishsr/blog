class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  mount_uploader :picture, PictureUploader
  validates :title, presence: true, 
                    length: { in: 3..150 }
  validates :entry, presence: true,
                    length: { in: 15..5000 }
  validate :picture_size

  private
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
