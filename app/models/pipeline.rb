class Pipeline < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :deals
end
