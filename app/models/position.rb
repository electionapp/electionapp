class Position < ApplicationRecord
	belongs_to :election
	has_many :candidates
end
