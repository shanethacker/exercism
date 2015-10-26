defmodule Teenager do
  def hey(input) do
    cond do
      String.strip(input) == ""
        -> reply(:silence)

      String.ends_with?(input, "?")
        -> reply(:question)

      String.upcase(input) == input && String.downcase(input) != input
        -> reply(:yell)

      true 
        -> reply(:else)
    end
  end

  defp reply(:silence) do
    "Fine. Be that way!"
  end

  defp reply(:question) do
    "Sure."
  end

  defp reply(:yell) do
    "Whoa, chill out!"
  end

  defp reply(_) do
    "Whatever."
  end
end
