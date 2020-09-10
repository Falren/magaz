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
end
