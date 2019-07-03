# .conkyrc compiler
![Free-form conky layout](http://spencertipping.com/conky-desktop.png)

Conky is a great tool, but its text-flow positioning model makes it really hard
to do anything beyond a single-column vertical layout. However, it gives you
the low-level tools to do better, assuming you can predict where it will put
things. The conkyrc compiler does this and gives you two modifications that
make it possible to use flexible spatial positioning:

1. It removes all vertical space produced by line breaks.
2. It introduces a positioning command, `@x,y`, that supports either absolute
   or relative coordinates.

`x` and `y` each take the form `\+?-?\d+`, where a `+` prefix indicates a
relative movement (the last set position is always the base, so unfortunately
you can't have relative movements that are parameterized on text width).

## Usage
```sh
$ ./conkyc conkyrc > ~/.conkyrc
$ DPI=112 LINE_SPACING=1.4 ./conkyc conkyrc > ~/.conkyrc
```

`DPI` and, more rarely, `LINE_SPACING`, may need to be tuned depending on your
display settings.

See the [included conkyrc](conkyrc) for a fairly complete example (it's the one
I used for the screenshot).

## Bugs
- Fails miserably if you use conky's conditionals in certain ways.
- Some edge cases that happen if you change font sizes in the middle of your
  conkyrc. (These can usually be worked around by some relative adjustment.)
- `conkyc` loses track of vertical space if you draw graphs/bars taller than
  the tallest font's line height. Ideally it would look for such commands and
  figure this out.
