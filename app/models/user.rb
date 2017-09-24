class User < ApplicationRecord
  has_many :comments, :as => :imageable
end
