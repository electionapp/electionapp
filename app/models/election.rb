class Election < ApplicationRecord
	validates :title, presence: true
end
