class Score < ActiveRecord::Base
  belongs_to :assessment
  belongs_to :activity
  
  validates :score, :inclusion => {:in => [1,2,3,4,5], allow_blank: false, message: "maturity scores must be between 1-5"}
  validates :target, :inclusion => {:in => [1,2,3,4,5], allow_blank: true, message: "maturity targets must be between 1-5"}

  def target
    val = self.read_attribute(:target)
    if val.blank?
      self.score.eql?(5) ? 5 : self.score+1
    else
      val
    end
  end

end
