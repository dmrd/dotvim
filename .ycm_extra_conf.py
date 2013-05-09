# Search up tree to find cpp option files for YouCompleteMe
# David Dohan & Nikhilesh Sigatapu

import os
import vim
# Specify compiler flags for the YouCompleteMe plugin in Vim.
def FlagsForFile(filename):
    vim.command("set noautochdir")
    vim.command("cd " + os.path.dirname(filename))
    filetype = vim.eval("&filetype")
    names = [".coptions", ".clang_complete", ".coptions", ".cppoptions", ".cxxoptions"]
    cdir = os.path.abspath(os.getcwd())
    found = None
    while found == None and len(cdir) > 1:
        for name in names:
            cur = cdir + "/" + name
            if (os.path.isfile(cur)):
                found = cur
                break
        cdir = os.path.dirname(cdir)
    if found != None:
        print("Found: " + found)
        vim.command("pwd")
        print(os.path.dirname(found))
        vim.command("cd " + os.path.dirname(found))
        vim.command("pwd")

    try:
        flags =  [line.strip() for line in open(found, 'r')]
    except:
        flags = []
    
    flags = [line.strip() for line in flags]

    if filetype == 'c':
        command = "let g:syntastic_c_compiler_options=' " + ' '.join(flags) + "'"
        vim.command(command)
    if filetype == 'cpp':
        flags += ['-x', 'c++']
        command = "let g:syntastic_cpp_compiler_options=' " + ' '.join(flags) + "'"
        vim.command(command)

    return { 'flags': flags, 'do_cache': True }
