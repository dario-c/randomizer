class Tipp < ActiveRecord::Base

  validates :name, presence: true



  def self.random_ten

    @random_count =  []
    @count =         Tipp.count

    (1..@count).each{|x| @random_count << x }

    @random_ids = @random_count.shuffle!.take(5)

    @query_of_randoms = Tipp.where({id: [@random_ids]})
  end


end


