class UserPolicy < ApplicationPolicy
  def create?
    true
  end
  def new?
    create?
  end

  def update?
    user.admin? || user
  end

  def edit?
    update?
  end
  def destroy
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
