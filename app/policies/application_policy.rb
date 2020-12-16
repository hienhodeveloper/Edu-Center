class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end

  def check_permission(action)
    if @user 
      user_permissions = UserPermission.where(user_id: @user.id)
      result = user_permissions.each do |user_per|
        user_per.permission.permission_details.each do |per_detail|
          if per_detail.action_code == action
            return true
          end
        end
      end
    end
    return false
  end
end
