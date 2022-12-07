class MissionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # uniquement les missions qui ont un statut false(=pas de candidate validé) et qui n'appartiennent pas au current_user
      scope.where(status: false).where.not(user_id: user.id)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def myindex?
    true
  end

  def myindex_candidate?
    true
  end
end
