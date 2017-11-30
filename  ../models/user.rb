class User < ApplicationRecord
  has_many :saver_recipes, foreign_key: "saver_id", class_name: "SaverRecipe"
  has_many :saved_recipes, through: :saver_recipes
  has_many :recipes, foreign_key: "author_id", class_name: "Recipe"
  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: :link_to_image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_secure_password

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :first_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def link_to_image
    "https://lh3.googleusercontent.com/H9yAIsZYqbIOh_E1ON90chVhO6SYSD6ucV-XirZXkMFDqLRjGoztobaxx1XS9CB4lfg=w300"
  end

end
