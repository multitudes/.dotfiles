layout src

set history save on
set history filename ~/.gdb_history
set history size unlimited

# Enable colorized output
set style enabled on

# Set pagination off
set pagination off

# Set a custom prompt
set prompt (gdb) 

# Enable enhanced TUI mode
set tui border-kind ascii
set tui tab-width 4
set tui compact-source on

# Set a breakpoint at main
break main