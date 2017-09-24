class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :comment, required: false
  belongs_to :imageable, :polymorphic =>true
end
