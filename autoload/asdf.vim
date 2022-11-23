function! ParseCurrent(line)
  return split(a:line, '\v\s+')
endfunction

function! asdf#CurrentAll()
  let command = printf('asdf current')
  let output = system(command)
  if v:shell_error != 0
    return []
  endif
  let lines = split(trim(output), '\v\n')
  let versions = []
  for line in lines
    let versions = add(versions, ParseCurrent(line))
  endfor
  return versions
endfunction

function! asdf#Current(plugin)
  let command = printf('asdf current %s', a:plugin)
  let output = system(command)
  if v:shell_error != 0
    return [] 
  endif
  return ParseCurrent(trim(output))
endfunction

function! asdf#Ensure(...)
  for plugin in a:000
    if asdf#Current(plugin) == []
      return 0
    endif
  endfor
  return 1
endfunction

function! asdf#Interpolate(template)
  let template = a:template
  for plugin in asdf#CurrentAll()
    let template = substitute(template, printf(':%s:', plugin[0]), plugin[1], 'g')
  endfor
  return template
endfunction

