defmodule Day2 do
  @moduledoc """
  Documentation for `Day2`.
  """

  @input_file "input.txt"

  @spec run(String.t()) :: integer()
  def run(input_file \\ @input_file) do
    input_file
    |> parse_input()
    |> Stream.map(fn [a, b] -> {convert_to_rps(a), convert_to_rps(b)} end)
    |> Enum.reduce(0, &(calculate_score(&1) + &2))
  end

  def run2(input_file \\ @input_file) do
    input_file
    |> parse_input()
    |> Stream.map(fn [a, b] -> {convert_to_rps(a), calculate_play(a, b)} end)
    |> Enum.reduce(0, &(calculate_score(&1) + &2))
  end

  defp parse_input(input_file) do
    input_file
    |> File.read!()
    |> String.split("\n")
    |> Stream.map(fn item ->
       String.split(item, " ")
    end)
  end

  defp convert_to_rps("A"), do: :rock
  defp convert_to_rps("B"), do: :paper
  defp convert_to_rps("C"), do: :scissors
  defp convert_to_rps("X"), do: :rock
  defp convert_to_rps("Y"), do: :paper
  defp convert_to_rps("Z"), do: :scissors

  defp calculate_play("A", "X"), do: :scissors
  defp calculate_play("B", "X"), do: :rock
  defp calculate_play("C", "X"), do: :paper
  defp calculate_play("A", "Y"), do: :rock
  defp calculate_play("B", "Y"), do: :paper
  defp calculate_play("C", "Y"), do: :scissors
  defp calculate_play("A", "Z"), do: :paper
  defp calculate_play("B", "Z"), do: :scissors
  defp calculate_play("C", "Z"), do: :rock


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
