defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    count_list(l, 0)
  end

  # Catch the empty tail of an exhausted list and return the final count 
  defp count_list([], acc) do
    acc
  end

  # Peel off the first element in the list, increment, and continue doing it while passing the new tail and new total
  defp count_list([head|tail], acc) do
    count_list(tail, acc + 1)
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reverse_list(l, [])
  end

  # Catch the empty list and return the reversed list
  defp reverse_list([], acc) do
    acc
  end

  # Grab the head and stuff it into a new list, then do the same with the tail
  defp reverse_list([head|tail], acc) do
    reverse_list(tail, [head|acc])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    map_list(l, f, []) |> reverse()
  end
  
  # Catch the empty list and return the results
  defp map_list([], _, acc) do
    acc
  end
  
  # Apply the function to the head and stuff it into a new list, repeating
  defp map_list([head|tail], f, acc) do
    map_list(tail, f, [f.(head)|acc])
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    filter_list(l, f, []) |> reverse()
  end
  
  # Catch the empty list and return the results
  defp filter_list([], _, acc) do
    acc
  end
  
  # Check the head to see if it passes, and if it does, stuff into new list, repeating
  defp filter_list([head|tail], f, acc) do
    if f.(head) do
      filter_list(tail, f, [head|acc])
    else
      filter_list(tail, f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    reduce_list(l, acc, f)
  end
  
  # Catch the empty list and return the results
  defp reduce_list([], acc, _) do
    acc
  end
  
  # Grab the head and accumulator and perform the function on them
  defp reduce_list([head|tail], acc, f) do
    reduce_list(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    append_list(reverse(a), b)
  end
  
  # Catch the empty a list and return the results
  defp append_list([], acc) do
    acc
  end
  
  # Grab the head of the a list and add it to the b list
  defp append_list([head|tail], acc) do
    append_list(tail, [head|acc])
  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reverse(ll) |> reduce([], &(append(&1, &2)))
  end
end
