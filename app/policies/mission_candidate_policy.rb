class MissionCandidatePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def myindex_candidate?
    true
  end

  def new?
    record.mission.user != user
  end

  def create?
    new?
  end

  def accepted?
    record.mission.user == user
  end

  def declined?
    record.mission.user == user
  end
end
