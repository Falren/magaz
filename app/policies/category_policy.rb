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
end
