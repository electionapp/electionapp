class User < ApplicationRecord
  include Clearance::User
  has_and_belongs_to_many :elections
end
