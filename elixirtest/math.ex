defmodule Test.Math do
  def sum(a, b) do
    a + b
    a + b + b
  end

end


IO.puts Test.Math.sum(1,2)

# default args
defmodule Concat do
  def join(a, b \\ nil, sep \\ " ")

  def join(a, b, _sep) when is_nil(b) do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
end

IO.puts Concat.join("Hello", "world")      #=> Hello world
IO.puts Concat.join("Hello", "world", "_") #=> Hello_world
IO.puts Concat.join("Hello")               #=> Hello

#recursion
defmodule Recursion do
  def print_multiple_times(msg, n) when n <= 1 do
    IO.puts msg
  end

  def print_multiple_times(msg, n) do
    IO.puts msg
    print_multiple_times(msg, n - 1)
  end
end

Recursion.print_multiple_times("Hello!", 3)
# Hello!
# Hello!
# Hello!


# reduce and map
defmodule MathAcc do
#pattern matching [ head | tail ]
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end
end

IO.puts MathAcc.sum_list([1, 2, 3], 0) #=> 6

[head | tail ] = [1,67,69]
#[1, 67, 69]
to_string(head) <> to_string(tail)
#"1CE"

defmodule MathMap do
  def double_each([head | tail]) do
    [head * 2 | double_each(tail)]
  end

  def double_each([]) do
    []
  end
end

IO.puts to_string(MathMap.double_each([1, 2, 3])) #=> [2, 4, 6]

map = %{:a => 1, 2 => :b}

IO.puts map[:a]
IO.puts map[2]

