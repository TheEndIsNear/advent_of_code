defmodule Day1 do
  @spec solve() :: integer()
  def solve do
    read_input()
    |> reduce_list()
  end

  def solve2 do
    read_input()
    |> iterate_list()
  end

  @spec read_input() :: list(integer())
  defp read_input do
    "lib/input.txt"
    |> File.read!()
    |> String.split()
    |> Enum.map(&String.to_integer/1)
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

  @spec iterate_list(list(integer())) :: integer()
  defp iterate_list(list), do: iterate_list_helper(list, 1)

  defp iterate_list_helper([hd | tl], index) do
    if index == Enum.count(tl) do
      iterate_list_helper(tl, 1)
    else
      {:ok, element} = Enum.fetch(tl, index)

      case add_two_elements(hd, element, tl) do
        {} ->
          iterate_list_helper([hd | tl], index + 1)

        {val1, val2, val3} ->
          val1 * val2 * val3
      end
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

  @spec add_two_elements(integer(), integer(), list(integer())) :: tuple()
  defp add_two_elements(_element1, _element2, []), do: {}

  defp add_two_elements(element1, element2, [hd | tail]) do
    value = element1 + element2 + hd

    if value == 2020 do
      {element1, element2, hd}
    else
      add_two_elements(element1, element2, tail)
    end
  end
end
