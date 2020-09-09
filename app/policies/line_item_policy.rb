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
  class Scope < Scope
    def resolve
    end
  end
end
