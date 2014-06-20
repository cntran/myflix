class Video < ActiveRecord::Base
	belongs_to :category
  has_many :reviews, -> { order('created_at DESC') }
  has_many :queue_items

  # validates_presence_of :title, :description
  validates :title, presence: true
  validates :description, presence: true

  def self.search_by_title(search_term) 
    return [] if search_term.blank?
    where("title LIKE ?", "%#{search_term}%").order("created_at DESC")
  end

  def average_rating
    
    if self.reviews.count > 0 
      rating_total = 0
      self.reviews.each do |review|
        rating_total += review.rating
      end

      rating = rating_total / self.reviews.count

      rating
    else
      0
    end
  end

end
