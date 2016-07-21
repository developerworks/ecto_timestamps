defmodule EctoTimestamps.Local do
  def autogenerate(precision \\ :sec)
  def autogenerate(:sec) do
    {date, {h, m, s}} = :erlang.localtime
    erl_load({date, {h, m, s, 0}})
  end
  def autogenerate(:usec) do
    timestamp = {_, _, usec} = :os.timestamp
    {date, {h, m, s}} = :calendar.now_to_local_time(timestamp)
    erl_load({date, {h, m, s, usec}})
  end
  def erl_load({{year, month, day}, {hour, min, sec, usec}}) do
    %Ecto.DateTime{
      year: year, month: month, day: day,
      hour: hour, min: min,     sec: sec, usec: usec
    }
  end
end
