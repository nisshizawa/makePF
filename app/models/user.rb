class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses, dependent: :destroy
  has_many :simulations, dependent: :destroy
  has_many :item_comments, dependent: :destroy
  has_many :hens, dependent: :destroy
  has_many :cows, dependent: :destroy
  has_many :pigs, dependent: :destroy

  scope :only_active, -> { where(is_active: true) }

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true, uniqueness: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

  def full_name
    first_name + " " + last_name
  end

  def full_name_kana
    first_name_kana + " " + last_name_kana
  end
  
  def has_in_cart(item)
    cart_items.find_by(item_id: item.id)
  end   
  
  def self.guest
    user = find_by(email: 'guest@example.com') 
    if user.nil?
      user = create!(password: SecureRandom.urlsafe_base64, last_name: 'gest', first_name: 'gest', first_name_kana: 'gest', last_name_kana: 'gest', postal_code: '0000000', address: '仮番地', telephone_number: '11111111111', email:'guest@example.com' )
    end
    return user
  end   
  
end  

