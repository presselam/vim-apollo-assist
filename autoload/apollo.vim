vim9script
#
# Title: <FILENAME>
# Descr: <MODULE NAME>
# Date : <DATE>
# Ver  : 1.0

g:ata_executable = '/home/apressel/workspace/cxap/apollo/dist/apollo'

export def g:ATADocument()

  final chat_mode = 'document-' .. &filetype
  echom strftime('%F %X') .. " - ATADocument - " .. 'Starting document (' .. chat_mode .. ')'
  final start_line = getpos("'<")[1]
  final end_line   = getpos("'>")[1]

  final lines = []
  for i in range(start_line, end_line)
    add(lines, getline(i))
  endfor

  var text = join(lines, "\n")
  text = shellescape(text)

  final cmd = g:ata_executable .. " --vim=" .. chat_mode .. " " .. text
  final output = trim(system(cmd))

  new
  setlocal buftype=nofile
  file "apollo"
  vertical resize 30

  append(0, split(output, "\n"))

enddef

#defcompile
