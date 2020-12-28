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

  def create? 
    return check_permission('CREATE_USER')
  end

  def index?
    return check_permission('SEE_ALL_PROFILE')
  end

  def show?
    if @user == nil 
      return false
    end
    if @record.id == @user.id
      return true
    end
    if check_permission('SEE_ALL_PROFILE')
      return true
    end
    if @record.role == 'teacher' && check_permission('SEE_TEACHER_PROFILE')
      return true
    end
    return false
  end

  def show_permission?
    if @user == nil 
      return false
    end
    if @record.id == @user.id
      return true
    end
    if @user.admin?
      return true
    end
    return false
  end

  def edit_permission?
    if @user == nil 
      return false
    end
    if @user.id == @record.id && @user.admin?
      return false
    end
    if check_permission('EDIT_USER_PERMISSION')
      return true
    end
    return false
  end
end
