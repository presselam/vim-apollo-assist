vim9script
#
# Title: <FILENAME>
# Descr: <MODULE NAME>
# Date : <DATE>
# Ver  : 1.0

g:ata_executable = '/home/apressel/workspace/cxap/apollo/dist/apollo'

export def g:ATAImprove()
  echom strftime('%F %X') .. " - ATAImprove - " .. 'Starting Improve'
  ApolloRequest('improve')
enddef

export def g:ATADocument()
  echom strftime('%F %X') .. " - ATADocument - " .. 'Starting document'
  ApolloRequest('document')
enddef

def ApolloRequest(action: string)
  final start_line = getpos("'<")[1]
  final end_line   = getpos("'>")[1]

  final lines = []
  for i in range(start_line, end_line)
    add(lines, getline(i))
  endfor

  var text = join(lines, "\n")
  text = shellescape(text)

  final cmd = g:ata_executable 
    .. " --filetype=" .. &filetype
    .. " --vim=" .. action .. " "
    .. action .. " the following code: " .. text
  final output = trim(system(cmd))


  final bufId = bufnr('apollo', 1)
  execute 'buffer' bufId
  new
  setlocal buftype=nofile bufhidden=hide noswapfile nomodified
  vertical resize -20 

  append(0, split(output, "\n"))
enddef


#defcompile
