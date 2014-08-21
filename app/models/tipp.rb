class Tipp < ActiveRecord::Base
  belongs_to :city
  belongs_to :user
  has_many :comments

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :user_id, :city_id, :streetname, presence: true    

  accepts_nested_attributes_for :comments

  def self.random_ten
    @random_count =  []
    @count =         Tipp.count

    (1..@count).each{|x| @random_count << x }

    @random_ids = @random_count.shuffle!.take(5)

    @query_of_randoms = Tipp.where({id: [@random_ids]})
  end

  def update_points(role)
    puts "Tipps points are: #{tipp.points}"
    new_ammount = 0

    if role == "regular"
      new_ammount = 5
    elsif role == "ambassador"
      new_ammount = 10
    end

    self.points += new_ammount
    self.save!
  end
end


