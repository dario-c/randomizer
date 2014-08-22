class Tipp < ActiveRecord::Base
  attr_accessor :image, :remote_image_url

  belongs_to :city
  belongs_to :user
  has_many :comments

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :user_id, :city_id, :streetname, :points, presence: true 


  accepts_nested_attributes_for :comments
  mount_uploader :image, ImageUploader
  
  def self.random_five_unlogged
    all_tipps = Tipp.where(offer: true).pluck(:id)
    @random_ids = all_tipps.sample(5)
  end

  def self.random_five_logged
    all_tipps = Tipp.all.pluck(:id)
    @random_ids = all_tipps.sample(5)
  end

  def self.find_these(array)

    @query_of_randoms = Tipp.where({id: array})
  end


  def update_points(action, role)
    new_ammount = 0
    if action == "created"
      
      if role == "regular"
        new_ammount = 10
      elsif role == "ambassador"
        new_ammount = 100
      end

    elsif action == "commented"
      
      if role == "regular"
        new_ammount = 5
      elsif role == "ambassador"
        new_ammount = 10
      end

    end

    self.points += new_ammount
    self.save!
  end

  def self.random_five
    all_tipps = Tipp.all.pluck(:id)
    random_ids = all_tipps.sample(5)

    @query_of_randoms = Tipp.where({id: random_ids})
  end

end


