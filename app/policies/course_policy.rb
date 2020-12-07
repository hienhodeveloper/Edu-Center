class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user != nil
        if @user.admin? 
          scope.all
        elsif @user.teacher?
          all = scope.where(status: "approved").where('user_id NOT IN (?)', [@user.id])
          privateCourse = scope.where(user_id: @user.id)
          return all + privateCourse
        elsif @user.student?
          scope.where(status: "approved")
        end
      else
        # Guest
        scope.where(status: "approved")
      end
    end
  end

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    first = Course.where(:id => record.id, :status => "approved")
    if @user != nil
      second = Course.where(user_id: @user.id)
      first.exists? or second.exists? or @user.admin?
    else
      first.exists? 
    end
  end

  def create?
    if @user != nil 
      return (@user.admin? or @user.teacher?)
    end
    return false
  end

  def update?
    if @user != nil 
      first = Course.where(:id => record.id, :user_id => @user.id)
      return (@user.admin? or first.exists?)
    end
    return false
  end

  def destroy?
    if @user != nil 
      first = Course.where(:id => record.id, :user_id => @user.id)
      return (@user.admin? or first.exists?)
    end
    return false
  end

  def allowSubcribe?
    @user && @user.student? && !@record.users.ids.include?(@user.id)
  end

  def allowUnsubcribe?
    @user && @user.student? && @record.users.ids.include?(@user.id)
  end
end