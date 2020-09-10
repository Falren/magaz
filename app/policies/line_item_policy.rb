class LineItemPolicy < ApplicationPolicy
  def create?
    user
  end

  def new?
    create?
  end

  def edit?
    create?
  end

  def destroy?
    create?
  end
end
