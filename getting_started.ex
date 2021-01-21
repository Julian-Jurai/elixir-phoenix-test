# Going through the official getting started guide 
# https://elixir-lang.org/getting-started/introduction.html

# `iex` to start interactive shell

# First Program vvvvvvvv
IO.puts "This is my first program"

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

cond do 
    2 + 2  == 5 -> 
        "This will no be true"
    2 * 2 == 3 -> 
        "Nor this"
    2 + 2 == 2  -> 
        "This is true"
    true  -> 
        "This is true true"
    1  -> 
        "This is true 1"
end 

If no match cond will throw an error