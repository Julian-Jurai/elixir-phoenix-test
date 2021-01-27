# Going through the official getting started guide 
# https://elixir-lang.org/getting-started/introduction.html

# `iex` to start interactive shell

# First Program vvvvvvvv
# IO.puts "This is my first program"

# run via exilir ~/getting_started.ex
# First Program ^^^^^^^^


#Basic Types

# iex> 1          # integer
# iex> 0x1F       # integer
# iex> 1.0        # float
# iex> true       # boolean
# iex> :atom      # atom / symbol
# iex> "elixir"   # string
# iex> [1, 2, 3]  # list
# iex> {1, 2, 3}  # tuple

# Division always returns a float, use div() or rem() for integer division and remainder
# Integer [operator] Integer = Integer (except division)

# Math methods
# div - integer division 
# rem - get remainder
# round - round to closest integer
# trunc - get integer part of float

# String  methods
# String.length
# String.upcase
# String.split
# is_list - checks if charlist (List)
# <> - concatenation
#      iex(36)> "Hellow" <> "World"
#      "HellowWorld"

# Lists methods
# ++ - concatinate lists
# -- - remove elements from lists
# hd/1 - head of list (first el)
# tl/1 - tail of list (everything but first el)
# | - prepend items to list [head | tail]

# Tuple methods
# tuple_size/1 - size of tuple
# elem/2 - retreive el from tuple
# put_elem/2 - put el in tuple

# Map methods
# Map.to_list
# Map.put
# Map.get
# put_in 
# update_in
# | 

# Type check methods
# is_boolean
# is_number
# is_integer
# is_float
# is_function

# Other methods
# h - helper for a method eg:
#     iex> h(trunc)
#     iex> h(Enum)
#     iex> h(Enum.map)
#     iex> h(Enum.reverse/1)
# i - inspect values
#     iex(56)> i 'hello'


# Arity - Number of arguments
# Doc description of methods is done using arity
# trunc/1 - trunc takes 1 argument


# Atoms (symbols) are constants whose value is its name
# iex> :apple == :apple
# true
# iex> :apple == :orange
# false

# Booleans are also atoms
# iex> true == :true
# true
# iex> is_atom(false)
# true
# iex> is_boolean(:false)
# true


# Aliases are constructs that start in uppercase and are also atoms
# iex(33)> is_atom(Enum)
# true

# String interpolation
# iex(37)> string = :atom
# :atom
# iex(38)> "Hello #{string}"
# "Hello atom"

# Anonymous functions
# delimited by the words `fn` and `end` and invoked with a dot perceeding the arguments
# anonymous are clousers
# add = fn a,b -> a + b end
# add.(1,2)
# 3

# lists operators never modify the existing array. They always return a new array.
# Elixir data structures are immutable; there's a guarantee that objects will never mutate in memory

# single quotes and doubdle quotes are different types

# Tuples 
# tuples like lists can hold any value
# tuples are zero indexed

# List vs Tuples

# Lists are stored as linked lists
# reads - O(n)
# concatenation - O(n)
# length - O(n)

# Tuples
# length - O(n)
# put_elem - O(1); new tuple is created each time

# Basic operators
# ++ / --; lists concat
# <>; strings concat
# not, !; boolean NOT
# and, &&; boolean AND
# or, ||; boolean OR
# ==; equality
# ===; equality but more strict when comparing integers and floats i.e 1 === 1.0 yeilds false
# >,<,<=,>=; number comparison
# =; match operator
# |; list prepend operator
# ^; pin operator
# |>; passes the output of the previous statement as the first argument to the following statement

# Boolean operators `and` and `or` are short cirucit operators and only evaluate
# the right side if the left side is not enough to determine the result. They must have 
# boolean on the right

# Use and, or and not when expecting booleans otherwise use &&, || and !

# You can compare different data types
# 1 < :atom
# it follows the sorting order:
# number < atom < reference < function < port < pid < tuple < map < list < bitstring

# Pattern Matching
# match operator `=`
# iex(92)> a = 1
# 1
# iex(93)> 1 = a
# 1
# iex(94)> 2 = a
# ** (MatchError) no match of right hand side value: 1

# Assingment is only done on the left side of the `=`
# a = 1

# detructuring 
# Tuples
# iex(97)> {a, b} = {1,2}
# {1, 2}
# iex(98)> a
# 1
# iex(100)> b
# 2

#Lists
# iex(101)> [a, b, c] = [1,2,3]
# [1, 2, 3]
# iex(102)> a
# 1
# iex(103)> b
# 2
# iex(104)> c
# 3
# iex(105)>

# No mixing
# iex(105)> {a, b, c} = [1,2,3]
# ** (MatchError) no match of right hand side value: [1, 2, 3]

# match on specific values
# iex(106)> {:ok, :happy, varname} = {:ok,:happy, 1231232}
# {:ok, :happy, 1231232}
# iex(107)> varname
# # 1231232
# iex(108)> {:ok, varname, :happy} = {:ok,:happy, 1231232}
# ** (MatchError) no match of right hand side value: {:ok, :happy, 1231232}


# Head / tail matching
#iex(111)> [head | tail] = [1,2,3,4]
# [1, 2, 3, 4]
# iex(112)> head
# 1
# iex(113)> tail
# [2, 3, 4]
# iex(114)>

# iex> list = [1, 2, 3]
# [1, 2, 3]
# iex> [0 | list]
# [0, 1, 2, 3]

# pin operator
#Prevents the rebinding of a varialbe to a new value
# iex(126)> x = 1
# 1
# iex(127)> 1 = x
# 1
# iex(128)> ^x = 2
# ** (MatchError) no match of right hand side value: 2

# If a variable maps to multiple values they must all be the same value
# {x, x} = {1, 1} # GOOD
# {x, x} = {1, 2} # ERROR ** (MatchError) no match of right hand side value: {1, 2}

# _ is a value that can never be read from 
# [head | _ ] = [1,2,3]

# case, cond, and if

# case
# case is useful when we want to check against different values


# casetest = fn tup -> 
#     case tup do 
#         {1, x, 3} when x > 0 -> 
#         "Would only match if x is positive; x was #{x}"
#         {1, x, 3}  -> 
#         "Would only match if general match of 3"
#         {1, x, 3, 4}  -> 
#         "Would only match if general match of 4"
#         _ -> 
#             "Would match any thing"
#     end 
# end

# iex(154)> casetest.({1,4,3})
# "Would only match if x is positive; x was 4"
# iex(155)> casetest.({1,-2,3})
# "Would only match if general match of 3"
# iex(156)> casetest.({1,-2,3,5})
# "Would match any thing"
# iex(157)> casetest.({})
# "Would match any thing"
# iex(158)> casetest.({1,-2,3,4})
# "Would only match if general match of 4"
# iex(159)>



# if no case is mathced it will error 

# case :ok do 
#     :error -> 
#         "Error"
# end 

# ** (CaseClauseError) no case clause matching: :ok


# Multiple clauses in anonymous functions

# f = fn 
#     x, y when x > 0 -> x + y 
#     x, y -> x * y 
# end

# f.(1,1)
# f.(-1,2)
    

# cond
# cond is useful when we want to find the first expression that doesn't evaluate to
# nil or false
# cond considers any value besides nil and false to be true

# cond do 
#     2 + 2  == 5 -> 
#         "This will no be true"
#     2 * 2 == 3 -> 
#         "Nor this"
#     2 + 2 == 2  -> 
#         "This is true"
#     true  -> 
#         "This is true true"
#     1  -> 
#         "This is true 1"
# end 

# If no match cond will throw an error


# if/2 and unless/2


# if true do 
#     IO.puts "Im in if"
# end 

# unless false do 
#     IO.puts "Im in unless"
# end 

# Using keywargs
# if true, do: :this, else: :that

# Binaries, strings, and charlists
#`?` - code points eg ?a # >  97

# charlist is a alist of integers where all elemets are code points



# iex will output code points if integer falls outside ascii range 0 to 127

# Keyword list
# A list of 2 tuple items where the first item in the tuple is an atom
# iex(6)> list = [{:a, 'happy'}]
# [a: 'happy']
# iex(7)> list == [a: 'happy']
# true
# iex(9)> list ++ [a: 1]
# [a: 'happy', a: 1]

# values added to the front are fetched on lookup
# iex(9)> list = [{:a, 'happy'}]
# iex(10)> new_list = list ++ [a: 1]
# [a: 'happy', a: 1]
# iex(11)> new_list[:a]
# 'happy'

# keys must be atoms
# keys are ordered
# keys can not unique
# not used often in matching as order and length matters

# if false, do: :this, else: :that
# is the same as
# if(false, [do: :this, else: :that])
# is the same as
# if(false, [{:do, :this}, {:else, :that])

# Maps
# key-value store

# Allows subset matching similar as long as the key in the pattern is in the map

# ex> %{} = %{:a => 1, 2 => :b}
# %{2 => :b, :a => 1}
# iex> %{:a => a} = %{:a => 1, 2 => :b}
# %{2 => :b, :a => 1}
# iex> a
# 1
# iex> %{:c => c} = %{:a => 1, 2 => :b}
# ** (MatchError) no match of right hand side value: %{2 => :b, :a => 1}

# using |. Note this requires the key to exist. Cannot add new keys this way.
# dot accesss (map.c) only works for atom keys

# iex(15)> map = %{:a => 1}
# %{a: 1}
# iex(16)> new_map = Map.put(map,:c, 2)
# %{a: 1, c: 2}
# iex(17)> new_map = %{new_map | :c => 5}
# %{a: 1, c: 5}
# # iex(19)> new_map.c
# 5

# users = [
#     john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
#     mary: %{name: "Mary", age: 21, languages: ["Erlang", "F#",]}
# ]

# iex(22)> users[:john].age
# 27
# iex(23)> put_in users[:john].age, 32
# [
#   john: %{age: 32, languages: ["Erlang", "Ruby", "Elixir"], name: "John"},
#   mary: %{age: 21, languages: ["Erlang", "F#"], name: "Mary"}
# ]
# iex(24)>

# iex(24)> update_in users[:mary].languages, fn languages ->
# ...(24)> List.delete(languages, "F#")
# ...(24)> end
# [
#   john: %{age: 27, languages: ["Erlang", "Ruby", "Elixir"], name: "John"},
#   mary: %{age: 21, languages: ["Erlang"], name: "Mary"}
# ]
# iex(25)>


# Modules are used to group severl functions into a module
# defmodule Math do 
#     def sum(a,b) do 
#         a + b
#     end 
# end 

# Math.sum(1,3)

# Elixr project are organized in to three directories
# ebin - contains compiled bytcode
# lib - contains elixir code (.ex)
# test - containst test (.exs)

# `mix` is the tool responsblie for compliation and path reconcilliation

# .exs is used for scripting mode. The only differenec is the intention in that that .ex files 
#are MEANT to be compiled while .exs are not. 

# Named functions

# def/2 and defp/2

# defmodule Math do 
#     def sum(a,b) do
#         do_sum(a,b) 
#     end

#     defp do_sum(a,b) do 
#         a + b
#     end 
# end 


# IO.puts Math.sum(1,2)
# IO.puts Math.do_sum(1,2)
# 3
# function Math.do_sum/2 is undefined or private
#     Math.do_sum(1, 2)
#     getting_started.ex:445: (file)
#     (elixir 1.11.3) lib/code.ex:931: Code.require_file/2

# Function declartions support guards and multiple clauses
# clauses are evaluated in order of definition (top down)

# defmodule Math do 
#     def zero?(0) do # Function clause
#         true
#     end 

#     def zero?(x) when is_integer(x) do # Function clause with guard
#         false
#     end
# end 

# IO.puts Math.zero?(0)         #=> true
# IO.puts Math.zero?(1)         #=> false
# IO.puts Math.zero?([1, 2, 3]) #=> ** (FunctionClauseError)
# IO.puts Math.zero?(0.0)       #=> ** (FunctionClauseError)


# defmodule Math do 
#     def zero?(0), do: true
#     def zero?(x) when is_integer(x), do: false
# end 


# Function capturing using `&` (capture syntax)
# iex(11)> fun = &Math.zero?/1
# &Math.zero?/1
# iex(12)> is_function(fun)
# true
# iex(13)> fun.(0)
# true
# iex(14)>

# the capture syntax can also be used to create functions
# the first & represents tha capture group
# the proceeding &1 represents the arguments

# iex(14)> fun = &(&1 + 1)
# #Function<44.79398840/1 in :erl_eval.expr/5>
# iex(15)> fun.(5)
# 6
# iex(16)> fun = &(&1 + &2+ 1)
# #Function<43.79398840/2 in :erl_eval.expr/5>
# iex(17)> fun.(1)
# ** (BadArityError) #Function<43.79398840/2 in :erl_eval.expr/5> with arity 2 called with 1 argument (1)

# iex(17)> fun.(1,2)
# 4
# iex(18)>

# iex(18)> fun = &"Hello #{&1}"
# #Function<44.79398840/1 in :erl_eval.expr/5>
# iex(19)> fun.('World')
# "Hello World"

# &(&1 + 1)
# is the same as
# fn x -> x + 1 end

# Default arguments
# This is denoted using `var \\ value`

# defmodule Concat do 
#     def join(a, b \\ "world", sep \\ " ") do 
#         a <> sep <> b
#     end 
# end 
# IO.puts Concat.join("Hello")


# Loops in elixir are written using recursion

# defmodule Recursion do 
#     def print_multiple_times(msg, n) when n <= 1 do
#         IO.puts msg
#     end 

#     def print_multiple_times(msg, n) do
#         IO.puts msg
#         print_multiple_times(msg, n - 1)
#     end 
# end 

# Reduce and map algorithms
# defmodule Math do 
#     def sum_list([head | tail], accumulator) when length(tail) == 0 do 
#         head + accumulator
#     end 
    
#     def sum_list([head | tail], accumulator) do 
#         sum_list(tail, head + accumulator)
#     end 
# end 
# defmodule Math do 
#     def sum_list([], accumulator) do 
#         head + accumulator
#     end 
    
#     def sum_list([head | tail], accumulator) do 
#         sum_list(tail, head + accumulator)
#     end 
# end 

# IO.puts Math.sum_list([1,2,3,4], 0)

# defmodule Math do
#   def double_each([head | tail]) do
#     [head * 2 | double_each(tail)]
#   end

#   def double_each([]) do
#     []
#   end
# end
# iex> Math.double_each([1, 2, 3]) #=> [2, 4, 6]
# iex(61)> [1 | [ 2 | [3] ]]
# [1, 2, 3]

# Enumerables 

#LIST
# iex(63)> Enum.map([1,2,3], fn x -> x * 3 end)
# [3, 6, 9]

# MAP
# iex(65)> Enum.map(%{:a => 1, :b=> 2, :c => 3}, fn {_k,v} -> v * 3 end)
# [3, 6, 9]

# Ranges

# iex> Enum.reduce(1..3, 0, &+/2)
# iex(68)> Enum.map(1..3, &(5+&1))
# [6, 7, 8]
# iex(69)>

# Pipe |>
# iex(71)> [1,3,4] |> length
# 3


# Streams are composable Enums, they are lazy enums that are invoked only when the underlying 
# stream is passed to the Enum modiule


#Processes
# Processes are not OS processes
# Similar to threads
# When a message is sent to a process its stored in a process mailbox
# recieve goes through the process mailbox looking for matching messages

# pid = spawn fn -> 1 + 2 end
# self() #<- Current PID/ process

# # receive do 
# #     {:hello, msg} -> msg 
# # after 
# #     1_000 -> "nothing after 1s" # Timeout
# # end 

# parent = self()

# spawn fn -> send(parent, {:hello, self()}) end

# receive do 
#     {:hello, pid} -> "Got Hello from #{inspect pid}"
# after 
#     1_000 -> "Timeout of 1s"
# end 

# flush() # It flushes and prints all the messages in the mailbox.

# spawn will not propagte errors, use span_link if thats desired
# or Process.link
# use tasks for better error reporting Tasks

# We can also register a process using Process.register(pid, kv)
# send :kv, "Hello"


# Alias
# Allows alias that are lexicatlly scoped
#  with out the as: option its the same thing below setting the last part
# All modules are defined in a main Elixir namespace

# defmodule Stats do
#   alias Math.List, as: List #(same as alias Math.List)
#   
#   # In the remaining module definition List expands to Math.List.
# end

# Require and Import
# also lexically scoped
# require Integer
# import allows you to skip the module part i.e is_odd vs Integer.is_odd
# it brings all the Functions and Macros of Module un-namespaced into your module.

# use is used to extend a current module with code from another module

# module attributes
# They help annotate the module
# Serve as constants
# Elixir promotes the use of Markdown with heredocs to write readable documentation.

# defmodule Math do
#   @moduledoc """
#   Provides math-related functions.

#   ## Examples

#       iex> Math.sum(1, 2)
#       3

#   """

#   @doc """
#   Calculates the sum of two numbers.
#   """
#   def sum(a, b), do: a + b
# end

# defmodule MyServer do
#   @initial_state %{host: "127.0.0.1", port: 3456}
#   IO.inspect @initial_state
# end

# Module attributes are set during compile time

# Functions may be called when defining a module attribute, e.g
# defmodule MyApp.Status do
#   @service URI.parse("https://example.com")
#   def status(email), do: SomeHttpClient.get(@service)
# end

# Structs are extensions built on top of Maps that provide compile time checks

# defmodule User do 
#     defstruct name: "John", age: 12 
# end 
# iex> %User{}
# %User{age: 27, name: "John"}
# iex> %User{name: "Jane"}
# %User{age: 27, name: "Jane"}
# %User{name: name} = john <- pattern mathcing
# jane = %{ john | name: "Jane" } <- updates (no new keys

# Structs work with the functions from the map module since its
# essesntially a bare map
# Map.keys(jane)
# structus default value is nil if one isn't specified
# defmodule User do 
#     defstruct [:name]
# end 
# Doing it in reverse order will raise a syntax error:

# iex> defmodule User do                          
# ...>   defstruct [name: "John", age: 27, :email]
# ...> end
# ** (SyntaxError) iex:107: syntax error before: email

# Enforce Keys in structs
# defmodule Car do
#     @enforce_keys [:make]
#     defstruct [:model, :make] 
# end

# Comprehension

#Generators
# Pattern
# iex> values = [good: 1, good: 2, bad: 3, good: 4]
# iex> for {:good, n} <- values, do: n * n

# iex> for n <- 1..4, do: n * n
# [1, 4, 9, 16]

# Filters
# iex> multiple_of_3? = fn(n) -> rem(n, 3) == 0 end
# iex> for n <- 0..5, multiple_of_3?.(n), do: n * n
#[0,9]