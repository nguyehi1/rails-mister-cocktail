class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true, allow_blank: false

  def self.search(term)
    if term.present?
      where('name LIKE ?', "%#{term}%")
    else
      all
    end
  end

end
