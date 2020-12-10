class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user != nil && @user.admin? 
        scope.all
      else
        []
      end
    end
  end

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def user_profile
    @user && @user.admin?
  end
end
