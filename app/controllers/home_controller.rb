class HomeController < ApplicationController
  def index
    @courses = policy_scope(Course).select {|c| c.approved? }
  end
end
