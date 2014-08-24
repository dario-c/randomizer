class User < ActiveRecord::Base
  has_many :tipps
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true     
  validates :role, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter

  def update_karma(action)
     add_ammount = 0
     
    if action == "commented"
       add_ammount = 1
    elsif action == "created"
       add_ammount = 2
    elsif action == "downvoted"
      add_ammount = -5
    end

     self.karma += add_ammount
     self.update_role
     self.save!

  end

  def update_role
      
    self.role = "badkarma" if self.karma < 0
    self.role = "regular" if self.karma < 100 &&  self.karma >= 0
    self.role = "ambassador" if self.karma >= 100

  end



end
