class Election < ApplicationRecord
	validates :title, presence: true
	has_many :positions, dependent: :destroy
	has_and_belongs_to_many :users
end
