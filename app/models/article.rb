# Article class inherits from ActiveRecord::Base
class Article < ActiveRecord::Base
	# this line makes sure that when we delete an article that the comments will be deleted too
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 5 }


	# this makes sure that all titles have a min length of 5
	# validates :title, presence: true, length: { minimum: 5}

end
