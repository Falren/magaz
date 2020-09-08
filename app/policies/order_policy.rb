class OrderPolicy < ApplicationPolicy
  def create?
    user.admin? || user
  end
  def new?
    create?
  end

  def update?
    user.admin? || record.user_id
  end

  def edit?
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
