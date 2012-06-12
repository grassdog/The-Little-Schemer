# The Ten Commandments

## The First Commandment

When recurring on a list of atoms, `lat`, ask two questions about it: `(null? lat)` and `else`.

When recurring on a number, `n`, ask two questions about it: `(zero? n)` and `else`.

When recurring on a list of S-expressions, `l`, ask three question about it: `(null? l)`, `(atom? (car l))`, and `else`.

## The Second Commandment

Use `cons` to build lists.

## The Third Commandment

When building a list, describe the first typical element, and then cons it onto the natural recursion.

## The Fourth Commandment

Always change at least one argument while recurring.

* When recurring on a list of atoms, `lat`, use `(cdr lat)`.
* When recurring on a number, `n`, use `(sub1 n)`.
* And when recurring on a list of S-expressions, `l`, use `(car l)` and `(cdr l)` if neither `(null? l)` nor `(atom? (car l))` are true.

It must be changed to be closer to termination. The changing argument must be tested in the termination condition:

* When using `cdr`, test termination with `null?`
* When using `sub1`, test termination with `zero?`

## The Fifth Commandment

When building a value with `+`, always use `0` for the value of the terminating line, for adding 0 does not change the value of an addition.

When building a value with `x`, always use `1` for the value of the terminating line, for multiplying by 1 does not change the value of a multiplication.

When building a value with `cons`, always consider `()` for the value of the terminating line.

## The Sixth Commandment

Simplify only after the function is correct.

## The Seventh Commandment

Recur on the subparts that are of the same nature:

* On the sub-lists of a list.
* On the sub-expressions of an arithmetic expression.

## The Eighth Commandment

Use help functions to abstract from representations.

## The Ninth Commandment

Abstract common patterns with a new function.

## The Tenth Commandment

Build functions to collect more than one value at a time.

# The Five Rules

## The Law of Car

The primitive `car` is defined only for non-empty lists.

## The Law of Cdr

The primitive `cdr` is defined only for non-empty lists. The cdr of any non-empty list is always another list.

## The Law of Cons

The primitive `cons` takes two arguments. The second argument to cons must be a list. The result is a list.

## The Law of Null?

The primitive `null?` is defined only for lists.

## The Law of Eq?

The primitive `eq?` takes two arguments. Each must be a non-numeric atom.

