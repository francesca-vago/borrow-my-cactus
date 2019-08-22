class PlantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def update?
    record.user == user
  end

  def show?
    true
  end

  def destroy?
    record.user == user
  end

  def create?
    true
  end

  def search?
    true
  end
end
