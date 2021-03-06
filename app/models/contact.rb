class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :company, optional: true
  has_many :touchpoints, dependent: :delete_all
  has_and_belongs_to_many :deals
  
  validates :user, presence: true
  validates :name, presence: true
end
