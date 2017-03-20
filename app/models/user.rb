class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_one :profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def has_profile?
    profile.present? && !profile.id.nil?
  end

  def full_name
    profile.full_name
  end
end
