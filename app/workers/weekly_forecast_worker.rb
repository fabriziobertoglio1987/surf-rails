class WeeklyForecastWorker
  include Sidekiq::Worker

  def perform(args)
    set_location(args)
    execute_job if @location.present?
  end

  def execute_job
    return unless @location.storm.success?
    @location.forecast.update({ 
      weather: @location.storm.getWaves,
      tides: @location.storm.getTides,
    })
  end

  private
  def set_location(args)
    @location = Location.find_by(id: args["id"])
  end
end
