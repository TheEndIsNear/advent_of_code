defmodule Day1 do
  @spec solve() :: integer()
  def solve do
    "lib/input.txt"
    |> File.read!()
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> reduce_list()
  end

  @spec reduce_list(list(integer())) :: integer()
  defp reduce_list([]), do: 0
  defp reduce_list([hd | tail]) do
    case add_element(hd, tail) do
      {} ->
        reduce_list(tail)

      {val1, val2} ->
        val1 * val2
    end
  end

  @spec add_element(integer(), list(integer())) :: tuple()
  defp add_element(_element, []), do: {}
  defp add_element(element, [hd | tail]) do
    value = element + hd

    if value == 2020 do
      {element, hd}
    else
      add_element(element, tail)
    end
  end
end
