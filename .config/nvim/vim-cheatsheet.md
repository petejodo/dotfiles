# Vim Cheatsheet

- use `w` to go to the beginning of the next word
- use `e` to go to the end of the next word
- use `b` to go to the beginning of the previous word
- use `g``e` to go to the end of the previous word

- use `c`- in combination with something like `w` to "change word"
- use `y`- in combination with something like `w` to "yank word"
- use `d`- in combination with something like `w` to "delete word"

- use `f`- to go forward to character on current line
- use `F`- to go backward to character on current line
- use `t`- to go forward to before character on current line
- use `T`- to go backward to before character on current line

- use `+` to go to the next line, prefixing with a number will move that many lines
- use `-` to go to the previous line, prefixing with a number will move that many lines

- use `.` to repeat the last command

## Macros

- use `q`- to start recording a macro labeled by the next character
  - ex. `qq` will create a macro named "q"
- use `q` again to finish recording a macro
- use `@q` to use recorded macro "q"
  - can prefix with a number to apply the macro n-times

## Examples

- press `ci"` to change text within the current quotes ("")
- press `d$` to delete from current cursor position to end of line
- after searching, press `c``g``n`- to change the next search match

