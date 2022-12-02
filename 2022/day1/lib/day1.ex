defmodule Day1 do
  alias Day1.Elf

  @input_file "input.txt"

  @spec run(String.t()) :: [Elf.t()]
  def run(input_file \\ @input_file) do
    parse_file(input_file)
    |> Enum.with_index()
    |> Enum.map(fn {calories, index} ->
      Elf.new(%{calories: calories, total_calories: Enum.sum(calories), name: "Elf #{index}"})
    end)
    |> Enum.sort_by(& &1.total_calories, :desc)
  end

  @spec parse_file(String.t()) :: [integer()]
  def parse_file(input_file) do
    input_file
    |> File.read!()
    |> String.split("\n")
    |> Enum.chunk_while([], &chunk_fun/2, &after_fun/1)
  end

  defp chunk_fun("", acc) do
    {:cont, Enum.reverse(acc), []}
  end

  defp chunk_fun(element, acc) do
    {:cont, [String.to_integer(element) | acc]}
  end

  defp after_fun([]) do
    {:cont, []}
  end

  defp after_fun(acc) do
    {:cont, Enum.reverse(acc), []}
  end
end
