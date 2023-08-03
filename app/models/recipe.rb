class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :cooking_time, numericality: { greater_than: 0 }
  validates :preparation_time, numericality: { greater_than: 0 }
  validates :user_id, presence: true

  def toggle_public
    update(public: !public)
  end

  def add_to_shopping_list
    update(add_to_shopping_list: !add_to_shopping_list)
  end
end
