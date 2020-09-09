class OrderPolicy < ApplicationPolicy
  def create?
    user
  end
  def new?
    create?
  end

  def update?
    create?
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
