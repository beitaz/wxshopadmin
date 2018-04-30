class UserPolicy < ApplicationPolicy
  def index?
    show?
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def profile?
    true
  end

  def edit?
    update?
  end

  def update?
    true
  end

  def destroy?
    user.email == 'admin@example.com'
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
