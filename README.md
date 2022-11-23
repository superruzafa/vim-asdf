# vim-asdf

A vim plugin for the [asdf] tool version manager.

## Functions

### `asdf#Ensure(...)`

Checks that there is current active version for each plugin passed as argument.

```vimscript
if asdf#Ensure('nodejs', 'elixir', 'java')
  ...
endif
```

### `asdf#Current(plugin)`

Returns the current version set for a plugin.

```vimscript
let plugin = asdf#Current('elixir')

echo plugin[0] " elixir
echo plugin[1] " 1.13.4
echo plugin[2] " ~/.tool-versions

```

### `asdf#CurrentAll()`

Returns the info for all plugins having a current version.

```vimscript
let plugins = asdf#CurrentAll()

for plugin in plugins
  echo plugin[0] " elixir
  echo plugin[1] " 1.13.4
  echo plugin[2] " ~/.tool-versions
endfor

```

### `asdf#Interpolate(template)`

Interpolates a string replacing placeholders by current asdf versions.

```vimscript
echo asdf#Interpolate('~/.elixir_ls/release-:erlang:-:elixir:')

" ~/.elixir_ls/release-25.0-1.13.4
```

[asdf]: https://asdf-vm.com

