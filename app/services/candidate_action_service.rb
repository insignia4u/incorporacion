class CandidateActionService
  include ActiveModel::Model
  include Virtus.model

  validates :description, :user, :candidate, :category_name, presence: true

  attr_accessor :user
  attr_accessor :candidate
  attribute :category_name, String
  attribute :description, String

  def self.build_with(params = {}, user, candidate)
    builder = new(params)
    builder.user = user
    builder.candidate = candidate
    builder
  end

  def save
    return false unless valid?

    candidate_action = CandidateAction.new(attributes.slice(:description))
    candidate_action.user = user
    candidate_action.candidate = candidate

    user.company.action_categories.where(name: category_name).
      first_or_create.tap do |ac|
      ac.company = user.company
      candidate_action.action_category = ac
    end

    candidate_action.save

  end

end
