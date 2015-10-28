defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """

  def count(words) when is_list(words) do
    false
  end

  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
      |> String.downcase
      |> String.split
      |> count
  end
end
