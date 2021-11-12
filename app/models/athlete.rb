class Athlete < ApplicationRecord
  def lap(time)
    if !first_lap
      update(first_lap: time)
    elsif !second_lap
      update(second_lap: time)
    elsif !third_lap
      update(third_lap: time)
    else
      update(end_lap: time)
    end
  end

  def lap_one
    second_lap && first_lap ? (second_lap - first_lap).round(2) : 0.00
  end

  def lap_two
    third_lap && second_lap ? (third_lap - second_lap).round(2) : 0.00
  end

  def lap_three
    end_lap && third_lap ? (end_lap - third_lap).round(3) : 0.00
  end

  def total_time
    return 0 unless first_lap && second_lap && third_lap && end_lap

    (lap_one + lap_two + lap_three).round(3)
  end

  def diff_time
    first = Athlete.all

    return nil unless first.all? { |f| f.total_time.positive? }

    # first = first.map { |at| { total: at.total_time, id: at.id } }.sort { |l| -l[:total] }.first
    first = first.map { |at| { total: at.total_time, id: at.id } }.sort! { |x, y| x[:total] <=> y[:total] }.first

    return nil unless first[:id] != id

    (total_time - first[:total]).round(3)

  end
end
