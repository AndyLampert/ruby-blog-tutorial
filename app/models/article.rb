# Article class inherits from ActiveRecord::Base
class Article < ActiveRecord::Base
	# this makes sure that all titles have a min length of 5
	validates :title, presence: true, length: { minimum: 5}

end
