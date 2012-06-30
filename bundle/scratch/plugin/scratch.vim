" File: scratch.vim {{{
"
" English {{{
" Author: Bruce Who ( HuXuzhao at hotmail.com )
" Version: 1.0
" Last Update: 2004-11-13
" Initial: 2004-05-10
" Copyright (c) 2004 by Bruce Who
"
" Description: this script creates a scratch buffer for you, you can write
" anything there, but its content will not be saved, so DONT put any
" important things in scrath buffer! Several commands and keymaps will
" help you.
"     this scratch.vim is part of Bruce Who's vim package which is not fully
" finished.
"
" License:
" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of  the  License,  or
" (at your option) any later version.
" [ http://www.gnu.org/licenses/gpl.html ]
" 
" This program is distributed in the hope that it will be useful,  but
" WITHOUT  ANY  WARRANTY;  without  even  the  implied   warranty   of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR  PURPOSE.  See  the  GNU
" General Public License for more details.
" 
" You should have received a copy of the GNU  General  Public  License
" along with  this  program;  if  not,  write  to  the  Free  Software
" Foundation,  Inc.,  59  Temple  Place  -  Suite  330,   Boston,   MA
" 02111-1307, USA.
"
" Installation:	Drop it into one of your plugin directories
"
" Usage:
"   three commands:
"     ToggleScratch   toggle the scratch buffer
"     SplitScratch    split window to show the scratch buffer
"     AddtoScratch    append the text from register " to the scratch buffer,
"                     separated by a blank line
"   default keymaps:
"     <F4>s           ToggleScratch
"     <F4><S-s>       SplitScratch
"     <F4><C-s>       AddtoScratch
"
" Todo:
"    I've no ideas yet, :-<. Any suggestions are appreciated, :-)
"    - add a command to set how to put the register " to scrath buffer
" Bug:
"    - when scratch buffer is open, then you open another buffer,you need to
"      type <F4>s twice to get scratch buffer again.
"
" }}}
"
" ����(Chinese) {{{
"  ���ߣ������� ( HuXuzhao at hotmail.com )
"  �汾��1.0
"  ������޸ģ�2004-11-13
"  ���棺2004-05-10
"  Copyright (c) 2004 ������
"
"  �������˽ű����ڴ���һ��scratch��������������������ݸ�
"        дһЩ��ʱ�����ݶ����ش���һ���ļ����Ǻǡ������˳�vim
"        ����������������ݻ���ʧ�����Բ�Ҫ������дһЩ��Ҫ��
"        ���������ﻹ������һЩ����Ϳ�ݼ���
"        
"        ���scratch.vim�����µ�vim�����һ���֣�Ŀǰ��δ��ɣ���
"
"  ��Ȩ������GNU GPL(http://www.gnu.org/licenses/gpl.html)
"
"  ��װ������pluginĿ¼�¾�����
"
"  ʹ�ã�
"    �������
"     ToggleScratch   ����scratch������
"     SplitScratch    ��split window����scratch������
"     AddtoScratch    ��"�Ĵ��������ݴ���scratch���������ÿ�
"                     �зָ�
"    Ĭ�ϵĿ�ݼ���
"     <F4>s           ToggleScratch
"     <F4><S-s>       SplitScratch
"     <F4><C-s>       AddtoScratch
"
" ��һ����
"   ��û���뷨�������ʲô�뷨���Ը����ҡ�
"    - �ڲ���ģʽ�µ�scratch���ڣ�����normal mode����<S-F6>���ã�����ÿ��ճ���ռ�������⣬��ճ�����Ƿ����ⲿ��filter��
"    
" Bug:
"    - ��scratch buffer��ʱ����n�������µ�buffer����ʱ����
"      buffer��Ҫ����<F4>s���ܴ�scratch��������
"    }}}
" 
" Happy Vimming!
"
" }}}

if exists('g:whose_scratch_loaded')  "{{{
    finish
endif
let g:whose_scratch_loaded=1
"}}}

" Commands {{{
" toggle the scratch window
command! -nargs=0 ToggleScratch call s:ScratchBufferToggle(1)
" toggle the scratch buffer in a new split window
command! -nargs=0 SplitScratch call s:ScratchBufferToggle(0)
" append register " to buffer
command! -nargs=0 AddtoScratch call s:ScratchBufferAppend('+')
" }}}

" key maps, you can modify the keymaps here {{{
nnoremap <F4>s :ToggleScratch<CR>
nnoremap <F4><S-s> :SplitScratch<CR>
nnoremap <F4><C-s> :AddtoScratch<CR>
" }}}

" script variables {{{
" Scratch buffer name
let s:ScratchBufferName = "Scratch"
" not exist
let s:scratch_number = -1  
" not visuable
let s:visuable = 0 
" empty
let s:scratch_empty = 1
" }}}

function! s:ScratchBufferNew() " {{{
  if s:scratch_number == -1
    let curb = bufnr('')
    silent! exe 'edit ' . s:ScratchBufferName
    let s:scratch_number = bufnr(s:ScratchBufferName)
    let s:visuable = 0
    let s:scratch_empty = 1
    set buftype=nofile
    set bufhidden=hide
    set noswapfile
    set nobuflisted
    exe curb . "buffer"
  endif
endfunction
" }}}

function! s:ScratchBufferToggle(flag)  " {{{
" open the scratch buf
" flag : 0 split
"        1 not split
  let curb = bufnr('')
  call s:ScratchBufferNew()
  if s:visuable == 1
    if curb == s:scratch_number
      silent! bn
    else
      exe curb . 'buffer'
    endif
    if bufnr('') != s:scratch_number
      let s:visuable = 0
    endif
  else  "if s:visuable == 0 
    if a:flag == 0
      exe 'split +' . s:scratch_number . 'buffer'
      resize 10
    else
      exe s:scratch_number . 'buffer'
    endif
    let s:visuable = 1
  endif
endfunction
"}}}

function! s:ScratchBufferAppend(reg)  " {{{
  if s:scratch_number == -1
    call s:ScratchBufferNew()
  endif
  let curb = bufnr('')
  exe s:scratch_number . "buffer"
  normal G
  if s:scratch_empty == 0
    normal o
    exe 'normal "' . a:reg . 'p'
  else
    exe 'normal "' . a:reg . 'p'
    " !!! remove the extra line after pasting
    if line('.') == 2
      1delete _
    endif
    let s:scratch_empty = 0
  endif
  exe curb . "buffer"
endfunction
" }}}

" Modeline for ViM {{{
" vim600:fdm=marker fdl=0 fdc=2:
" }}}
