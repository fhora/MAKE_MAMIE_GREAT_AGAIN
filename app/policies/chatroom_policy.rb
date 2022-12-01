class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.select { |record| record.user == user || record.mission_candidate.user == user}
      # .joins(:mission_candidate).where(mission_candidate: {user: user})
    end
  end
    def create?
      record.user == user || record.mission_candidate.user == user
    end

    def show?
      record.user == user || record.mission_candidate.user == user
    end
end
