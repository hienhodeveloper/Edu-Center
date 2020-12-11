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

  def index?
    @user && @user.admin?
  end

  def show?
    if @user 
      return @user.admin?
    end
    return false
  end
end
