class AthletesController < ApplicationController

  def new
  end

  def create
  end

  def list
    @athletes = Athlete.all
    @laps = @athletes.map { |e|
      {
        id: e.id,
        name: e.name,
        first_lap: e.lap_one,
        second_lap: e.lap_two,
        third_lap: e.lap_three,
        total: e.total_time,
        diff_time: e.diff_time
      }
    }
    @laps.sort! { |x, y| x[:total] <=> y[:total] }
  end
end
