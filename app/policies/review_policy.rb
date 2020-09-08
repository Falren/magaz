class ReviewPolicy < ApplicationPolicy
  def new?
    user
  end

  def edit?
    user.admin? || record.user_id
  end

  def destroy?
    user.admin? || record.user.id
  end
  class Scope < Scope
    def resolve
        scope.all
    end
  end
end
