class ReviewPolicy < ApplicationPolicy
  def new?
    user
  end

  def edit?
    user.admin? || record.user_id == user
  end

  def destroy?
    user.admin? || record.user_id == user
  end
end
