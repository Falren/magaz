class UserPolicy < ApplicationPolicy
  def create?
    true
  end
  def new?
    create?
  end

  def update?
   user
  end

  def edit?
    update?
  end
  def destroy
    update?
  end
end
