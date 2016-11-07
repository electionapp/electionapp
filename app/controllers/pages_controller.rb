class PagesController < ApplicationController
  def new
  end
  before_action :require_login, only: [:new]
end
