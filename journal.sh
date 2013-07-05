#Cron script for 30-min activity journal
#-------------------------------------------

export DISPLAY=:0
gvim -c "call vimwiki#diary#make_note(v:count1)" + -c "r !date +'\%n= \%H:\%M =\%n'"
