class User < ActiveRecord::Base
  has_many :tipps
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true     
  validates :role, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


#User.find(2).karma


 def update_karma(action)
   add_ammount = 0
   
   if action == "commented"
     add_ammount = 1
   elsif action == "created"
     add_ammount = 2
   end

   self.karma += add_ammount
   self.save!
 end
end
