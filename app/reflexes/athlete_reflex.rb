# frozen_string_literal: true

class AthleteReflex < ApplicationReflex
  
  def start
    @running = true
    at = Athlete.where('id = ?', element[:data_id]).first
    at.lap(Time.now)

    lists = Athlete.all.map do |e|
      {
        id: e.id,
        name: e.name,
        first_lap: e.lap_one,
        second_lap: e.lap_two,
        third_lap: e.lap_three,
        total: e.total_time
      }
    end
    text = if !at.second_lap
             'Firts lap'
           else
             !at.third_lap ? 'Second lap' : 'Last Lap'
           end
    return if at.end_lap

    btn = "<button type='button' id='btn-lap' class='border ml-2 border-green-600 text-green-600 hover:bg-green-600 hover:text-gray-200 rounded px-4 py-2' data-reflex='click->AthleteReflex#start' data-id='<%=@athlete.id%>'>#{text}</button>"
    morph '#btn-lap', btn
    morph '#athletes-list', render(partial: 'athletes/list', locals: { lists: lists.sort! { |x, y| x[:total] <=> y[:total] } })
  end

  def change_selector
    @athlete = Athlete.where('id = ?', element[:value]).first
    @athlete.update(first_lap: nil, second_lap: nil, third_lap: nil, end_lap: nil) if @athlete.end_lap
  end

  def restar_data
    Athlete.update_all(first_lap: nil, second_lap: nil, third_lap: nil, end_lap: nil)
  end

end
