class Election < ApplicationRecord
	validates :title, presence: true
	has_many :positions, dependent: :destroy
end
