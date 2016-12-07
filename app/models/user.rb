class User < ApplicationRecord
  include Clearance::User
  validates :email, :format => { :with => /@pugetsound.edu/, :message => "must end in @pugetsound.edu" }
  has_and_belongs_to_many :elections
end
