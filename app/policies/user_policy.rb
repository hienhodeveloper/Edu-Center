class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.admin?
        return scope.all
      end
      return scope.where(role: 'teacher')
    end
  end

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    return check_permission('VIEW_USER') && @user.admin?
  end

  def show?
    if check_permission('VIEW_USER')
      if @user.admin? 
        return true
      end
      if @record.role == "admin"
        return false
      end
      if @user.teacher? && @record.role == 'student'
        return false
      end 
      if @record.id == @user.id
        return true
      end
      if @user.student? && @record.role == 'student'
        return false
      end
      return true
    end
    return false
  end
end
