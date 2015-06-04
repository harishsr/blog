class Article < ActiveRecord::Base
  validates :title, presence: true, 
                    length: { in: 3..150 }
  validates :entry, presence: true,
                    length: { in: 15..5000 }
end
