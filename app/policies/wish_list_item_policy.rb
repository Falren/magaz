class WishListItemPolicy < ApplicationPolicy
  def create
    true
  end

  def new?
    true
  end

  def update
    true
  end

  def edit?
    true
  end

  def destroy?
    true
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end