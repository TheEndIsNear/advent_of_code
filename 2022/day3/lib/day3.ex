defmodule Day3 do
  @moduledoc """
  Code to complete the day 3 puzzle
  """
  @input_file "input.txt"

  @spec run(String.t()) :: integer()
  def run(input_file \\ @input_file) do
    input_file
    |> parse_file()
    |> Enum.map(&split_in_half/1)
    |> Enum.reduce(0, &calculate_value/2)
  end

  def run2(input_file \\ @input_file) do
    input_file
    |> parse_file()
    |> Enum.chunk_every(3)
    |> Enum.reduce(0, &calc_for_three/2)
  end

  defp parse_file(input_file) do
    input_file
    |> File.read!()
    |> String.split()
  end

  defp split_in_half(line) do
    middle = div(String.length(line), 2)
    String.split_at(line, middle)
  end

  defp calculate_value({first, second}, acc) do
    m1 = MapSet.new(String.codepoints(first))
    m2 = MapSet.new(String.codepoints(second))

    m1
    |> MapSet.intersection(m2)
    |> MapSet.to_list()
    |> Enum.map(&value_for_char/1)
    |> Enum.sum()
    |> Kernel.+(acc)
  end

  defp calc_for_three([first, second, third], acc) do
    m1 = MapSet.new(String.codepoints(first))
    m2 = MapSet.new(String.codepoints(second))
    m3 = MapSet.new(String.codepoints(third))

    m1
    |> MapSet.intersection(m2)
    |> MapSet.intersection(m3)
    |> MapSet.to_list()
    |> Enum.map(&value_for_char/1)
    |> Enum.sum()
    |> Kernel.+(acc)
  end

  defp value_for_char("a"), do: 1
  defp value_for_char("b"), do: 2
  defp value_for_char("c"), do: 3
  defp value_for_char("d"), do: 4
  defp value_for_char("e"), do: 5
  defp value_for_char("f"), do: 6
  defp value_for_char("g"), do: 7
  defp value_for_char("h"), do: 8
  defp value_for_char("i"), do: 9
  defp value_for_char("j"), do: 10
  defp value_for_char("k"), do: 11
  defp value_for_char("l"), do: 12
  defp value_for_char("m"), do: 13
  defp value_for_char("n"), do: 14
  defp value_for_char("o"), do: 15
  defp value_for_char("p"), do: 16
  defp value_for_char("q"), do: 17
  defp value_for_char("r"), do: 18
  defp value_for_char("s"), do: 19
  defp value_for_char("t"), do: 20
  defp value_for_char("u"), do: 21
  defp value_for_char("v"), do: 22
  defp value_for_char("w"), do: 23
  defp value_for_char("x"), do: 24
  defp value_for_char("y"), do: 25
  defp value_for_char("z"), do: 26
  defp value_for_char("A"), do: 27
  defp value_for_char("B"), do: 28
  defp value_for_char("C"), do: 29
  defp value_for_char("D"), do: 30
  defp value_for_char("E"), do: 31
  defp value_for_char("F"), do: 32
  defp value_for_char("G"), do: 33
  defp value_for_char("H"), do: 34
  defp value_for_char("I"), do: 35
  defp value_for_char("J"), do: 36
  defp value_for_char("K"), do: 37
  defp value_for_char("L"), do: 38
  defp value_for_char("M"), do: 39
  defp value_for_char("N"), do: 40
  defp value_for_char("O"), do: 41
  defp value_for_char("P"), do: 42
  defp value_for_char("Q"), do: 43
  defp value_for_char("R"), do: 44
  defp value_for_char("S"), do: 45
  defp value_for_char("T"), do: 46
  defp value_for_char("U"), do: 47
  defp value_for_char("V"), do: 48
  defp value_for_char("W"), do: 49
  defp value_for_char("X"), do: 50
  defp value_for_char("Y"), do: 51
  defp value_for_char("Z"), do: 52
end
