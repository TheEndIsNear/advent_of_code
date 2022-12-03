defmodule Day2 do
  @moduledoc """
  Documentation for `Day2`.
  """

  @input_file "input.txt"

  @spec run(String.t()) :: integer()
  def run(input_file \\ @input_file) do
    input_file
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(fn item ->
      [a, b] = String.split(item, " ")
      {convert_to_rps(a), convert_to_rps(b)}
    end)
    |> Enum.reduce(0, &(calculate_score(&1) + &2))
  end

  defp convert_to_rps("A"), do: :rock
  defp convert_to_rps("B"), do: :paper
  defp convert_to_rps("C"), do: :scissors
  defp convert_to_rps("X"), do: :rock
  defp convert_to_rps("Y"), do: :paper
  defp convert_to_rps("Z"), do: :scissors

  defp calculate_score({_, b} = round) do
    score_for_choice(b) + score_for_winning(round)
  end

  defp score_for_choice(:rock), do: 1
  defp score_for_choice(:paper), do: 2
  defp score_for_choice(:scissors), do: 3

  defp score_for_winning({a, b}) when a == b, do: 3
  defp score_for_winning({:rock, :paper}), do: 6
  defp score_for_winning({:paper, :scissors}), do: 6
  defp score_for_winning({:scissors, :rock}), do: 6
  defp score_for_winning(_), do: 0
end
