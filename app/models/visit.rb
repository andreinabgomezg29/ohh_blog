class Visit < ApplicationRecord
  has_many :comments, :as => :imageable
end
