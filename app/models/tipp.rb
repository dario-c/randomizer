class Tipp < ActiveRecord::Base
  attr_accessor :image, :remote_image_url

  belongs_to :city
  belongs_to :user
  has_many :comments

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :user_id, :city_id, :streetname, :points, presence: true 


  accepts_nested_attributes_for :comments
  mount_uploader :image, ImageUploader
  
  def self.random_five(signed)
    if signed
      all_tipps = Tipp.all.pluck(:id)
    else
      all_tipps = Tipp.where(offer: true).pluck(:id)
    end
    @random_ids = all_tipps.sample(5)
  end

  def self.find_these(array)
    @query_of_randoms = Tipp.where({id: array})
  end


  def update_points(action, role)
    new_ammount = 0

    if action == "created"  
      new_ammount = 10 if role == "regular"
      new_ammount = 100 if role == "ambassador"
    
    elsif action == "commented"  
      new_ammount = 5 if role == "regular"
      new_ammount = 10 if role == "ambassador"
    end

    self.points += new_ammount
    self.save!
  end

  #  points = { created: { regular: 10, ambassador: 100 },
  #           commented: { regular: 5, ambassador: 10 }}

  # def update_points(action, role)

  #   new_ammount = points[action][role]

  #   self.points += new_ammount
  #   self.save!

end


