class Attendance < ActiveRecord::Base
  belongs_to :student
  validates :attended_on, uniqueness: {scope: :student_id, message: "you already logged your attendance today"}
  validates :seat, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 5}
  
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
