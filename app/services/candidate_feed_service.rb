class CandidateFeedService
  include Virtus.model

  attr_accessor :candidate

  def self.build_with(candidate)
    builder = new
    builder.candidate = candidate
    builder.feeds
  end

  def feeds
    tasks = candidate.task_candidate.order(completed_on: :desc)
                     .collect do |tc|
                        { message:message(tc.task, :title),
                          completed_on:tc.completed_on }
                      end
    programs = TrainingProgram.completed_by(candidate)
                        .collect do |p|
                          { message:message(p, :name),
                            completed_on:
                              candidate.task_candidate.where(task_id: p.tasks)
                                       .order(completed_on: :desc).first.completed_on }
                        end
    (tasks + programs).sort {|x,y| y[:completed_on] <=> x[:completed_on] }.take(10)
  end

  private
    def message(element, attribute)
      "#{element[attribute]} was completed."
    end
end
