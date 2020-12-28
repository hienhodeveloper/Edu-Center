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
    return Course.where(:id => @record.id).exists?
  end

  def create?
    check_permission('CREATE_COURSE')
  end

  def update?
    if check_permission('EDIT_COURSE')
      is_my_created = Course.where(:id => @record.id, :user_id => @user.id)
      return (@user.admin? or is_my_created.exists?)
    end
    return false
  end

  def destroy?
    if check_permission('DELETE_COURSE')
      is_my_created = Course.where(:id => @record.id, :user_id => @user.id)
      return (@user.admin? or is_my_created.exists?)
    end
    return false
  end

  def allowSubcribe?
    if @user == nil 
      return false
    end
    if check_permission('SUBCRIBE_COURSE')
      return !@record.users.ids.include?(@user.id)
    end
    return false
  end

  def allowUnsubcribe?
    if @user == nil 
      return false
    end
    if check_permission('UNSUBCRIBE_COURSE')
      return @record.users.ids.include?(@user.id)
    end
    return false
  end

  def allowShowSubcribeStudent? 
    if @user != nil 
      if check_permission('VIEW_SUBCRIBED_COURSE_STUDENTS') == false 
        return false
      end
      is_my_created = Course.where(:id => @record.id, :user_id => @user.id)
      return (@user.admin? or is_my_created.exists?)
    end
    return false
  end
end
