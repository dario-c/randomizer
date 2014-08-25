class Tipp < ActiveRecord::Base
  attr_accessor :image, :remote_image_url

  belongs_to :city
  belongs_to :user
  has_many :comments

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :user_id, :city_id, :streetname, :points, presence: true 

  accepts_nested_attributes_for :comments
  mount_uploader :image, ImageUploader
  acts_as_votable

  def self.search(query)
    where("name like ?", "%#{query}%") 
  end

  
  def self.random_five(signed)
    signed ? all_tipps = Tipp.where("points > ?", 0).pluck(:id) : all_tipps = Tipp.where("points > ? AND offer = ?", 0, false).pluck(:id)

    all_tipps.sample(5)
  end

  def self.find_these(array)
    Tipp.where({id: array})
  end


  def update_points(action, role)
    new_ammount = 0


    points = { created:  { badkarma: 0, regular: 10, ambassador: 100 },
              commented: { badkarma: 0, regular: 5, ambassador: 10 },
              was_upvoted:  { badkarma: 0, regular: 1, ambassador: 1 },
              was_downvoted: { badkarma: 0, regular: -1, ambassador: -1 }}

    new_ammount = points[action.to_sym][role.to_sym]
    self.points += new_ammount
    self.save
  end

  def random_comment

    Comment.random_comment(self.id)

  end





end


