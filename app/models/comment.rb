class Comment < ActiveRecord::Base
  belongs_to :article
  validates :name, presence: true,
                    length: { in: 2..40 }
  validates :body, presence: true,
                     length: { in: 2..1000 }
end
