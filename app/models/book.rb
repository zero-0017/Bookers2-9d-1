class Book < ApplicationRecord
  belongs_to :user
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  validates :star,presence:true

  validates :star,presence:true

  def self.search(search_word)
    Book.where(['category LIKE ?', "#{search_word}"])
  end

  scope :latest, -> {order(created_at: :desc)}
  scope :star_count, -> {order(star: :desc)}
end
