class User < ActiveRecord::Base
	has_secure_password
	has_many :boats
	has_many :userfollowships
	has_many :follows, through: :userfollowships, source: :boat
end
