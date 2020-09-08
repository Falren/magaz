class AddressPolicy < ApplicationPolicy
  def create?
    user.admin? || user
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    create?
  end

  def destroy?
    user.admin? || record
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
