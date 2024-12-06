```elixir
list = [1, 2, 3, 4, 5]

# Correct approach using Enum.reduce
new_list = Enum.reduce(list, [], fn x, acc ->
  if x != 3 do
    [x | acc]
  else
    acc
  end
end)
 |> Enum.reverse() # Reverse to maintain original order

IO.inspect(new_list)

#Alternative approach using recursion
defmodule ListHelper do
  def remove_element(list, element, acc \ []) do
    case list do
      [] -> Enum.reverse(acc)
      [head | tail] ->
        if head == element do
          remove_element(tail, element, acc)
        else
          remove_element(tail, element, [head | acc])
        end
    end
  end
end

new_list2 = ListHelper.remove_element(list,3)
IO.inspect(new_list2)
```