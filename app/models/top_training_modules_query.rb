class TopTrainingModulesQuery
  def initialize(limit: 10, days: 30.days)
    @limit = limit
    @days = days
  end

  # SELECT training_modules.*, COUNT(training_module_activities.training_module_id) as count
  # FROM "training_modules"
  # INNER JOIN "training_module_activities"
  #   ON "training_module_activities"."training_module_id" = "training_modules"."id"
  # WHERE (training_module_activities.created_at > '2020-08-27 16:50:14.519939')
  # GROUP BY training_modules.id
  # ORDER BY count DESC LIMIT 10
  def call
    TrainingModule.select('training_modules.*, COUNT(training_module_activities.training_module_id) as count')
                  .joins(:training_module_activities)
                  .where('training_module_activities.activity_name = ?', 'execute')
                  .where('training_module_activities.created_at > ?', DateTime.current - days)
                  .group('training_modules.id')
                  .order('count DESC')
                  .limit(limit)
  end

  private

  attr_reader :limit, :days
end
