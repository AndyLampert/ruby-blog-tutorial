class Comment < ActiveRecord::Base
  # this sets up an active record association
  belongs_to :article
end
