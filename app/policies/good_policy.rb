class GoodPolicy < ApplicationPolicy
  def adverts
    true
  end

  def discovers
    true
  end

  def detail
    true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
