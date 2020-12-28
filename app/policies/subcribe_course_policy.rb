class SubcribeCoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.admin? 
        scope.all
      elsif @user.teacher?
        scope.where(course_id: @user.courses.ids)
      elsif @user.student?
        scope.where(user_id: @user.id)
      end
    end
  end

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def create?
    check_permission('SUBCRIBE_COURSE')
  end
  
  def destroy?
    if check_permission('UNSUBCRIBE_COURSE')
      first = SubcribeCourse.where(user_id: @user.id, id: @record.id)
      return first.exists?
    end
    return false
  end
end
