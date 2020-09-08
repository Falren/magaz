class CategoryPolicy < ApplicationPolicy
  def create
    user.admin?
  end

  def new?
    create?
  end

  def update
    create?
  end

  def edit?
    create?
  end

  def destroy?
    create?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
