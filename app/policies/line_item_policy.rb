class LineItemPolicy < ApplicationPolicy
  def create?
    true
  end

  def new?
    create?
  end

  def edit?
    user.admin? || record.user_id
  end

  def destroy?
    user.admin? || record.user_id
  end
  class Scope < Scope
    def resolve
    end
  end
end
