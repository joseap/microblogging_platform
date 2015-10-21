class User < ActiveRecord::Base
	has_one :profile
	has_many :posts
	has_many :comments
	has_many :follows, foreign_key: :followee_id
	has_many :followings, foreign_key: :follower_id, class_name: "::Follow"
	has_many :followers, through: :follows, class_name: "User"
	
	validates_confirmation_of :password
  	validates_presence_of :password, :on => :create
  	validates_length_of :password, :in => 6..20, :on => :create
  	validates_presence_of :email
  	validates_uniqueness_of :email
  	validates_format_of :email, :with => /@/
  	validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  
	# def self.authenticate(username, password)
	# 	user = find_by_email(:email)
	# 	if user && user.password === params[:password]
	# 		user
	# 	else
	# 		nil 
	# 	end
	# end
end
