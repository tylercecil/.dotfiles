My Emacs Config
===============
This is the current state of my emacs config. It is about as unstable as
anything could be, so likely this documentation will go out of date. I'll be
brief.

File Layout
-----------
```
emacs.d
|--- init.el
     (Initializes use-package, and loads all config files.)
|--- elisp
|    |--- behaviorconfig.el
          (Configures things like spell check, autofill, helm, which-key, and
          any global behaviors and packages that will be used.)
|    |--- styleconfig.el
|    |    (Configures tab style, 80-column wrapping, etc...)
|    |--- themeconfig.el
|    |    (Configures the look of emacs.)
|    |--- keyconfig.el
|    |    (Configures global keyboard layout and Evil settings.)
|--- modes
|    |--- haskell-config.el
|    |    (Settings that will be used when haskell mode is active)
|    |--- latex-config.el
|    |    (Settings that will be used when latex mode is active)
|    |--- ...-config.el
|    |--- (Settings that will be used when ... mode is active)
|--- PG
|    (Only here until proof-general is added to melpa. See
|     https://github.com/milkypostman/melpa/pull/3454 )
|--- ...
|    (Various auto-generated files)
```
That's about all you need to know. Do note that all files in the `modes`
directory end in `-config.el`. This is to prevent name clashing. It used to be
that I had `latex.el` as a file, and *get this*, `latex` was already a package
name...
