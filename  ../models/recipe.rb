class Recipe < ApplicationRecord
  has_many :saver_recipes, foreign_key: "saved_recipe_id", class_name: "SaverRecipe"
  has_many :savers, through: :saver_recipes
  belongs_to :author, :class_name => "User", :foreign_key => :author_id
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_attached_file :image, styles: { medium: '300x300>', thumb: '50x50>' }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :name, presence: true
  validates :prep_time, presence: true
  validates :cook_time, presence: true
  validates :instructions, presence: true

  def times_saved
    self.savers.length
  end

  def self.published
    Recipe.all.find_all{|r| r.published}
  end

  def self.featured
    @weekly_recipes = Recipe.where(:created_at => 7.days.ago..Time.now).where(published: true)
    @weekly_recipes.sort_by{|r| r.savers.length}.reverse.first(6)
  end

  def self.top_users
    Recipe.published.sort_by{|r| r.savers.length}.reverse.map do |r|
      User.find(r.author_id)
    end.uniq.first(8)
  end

  def self.top_recipes
    Recipe.published.sort_by{|r| r.savers.length}.reverse.first(6)
  end

  def self.fast_food
    Recipe.published.sort_by{|r| r.prep_time + r.cook_time}.first(6)
  end

  def self.top_vegan
    Recipe.published.find_all{|r| r.vegan}.sort_by{|r| r.savers.length}.reverse.first(6)
  end

  def self.top_low_carb
    Recipe.published.find_all{|r| r.low_carb}.sort_by{|r| r.savers.length}.reverse.first(6)
  end

  def self.top_kosher
    Recipe.published.find_all{|r| r.kosher}.sort_by{|r| r.savers.length}.reverse.first(6)
  end

  def self.top_halal
    Recipe.published.find_all{|r| r.halal}.sort_by{|r| r.savers.length}.reverse.first(6)
  end

end
