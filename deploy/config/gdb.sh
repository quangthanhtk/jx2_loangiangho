export GDB_CONFIG="file ${GDB_FILE}
set pagination off
shell mkdir -p ./gdb_logs
shell cp -f ./gdb_logs/gdb_crash4.log ./gdb_logs/gdb_crash5.log
shell cp -f ./gdb_logs/gdb_crash3.log ./gdb_logs/gdb_crash4.log
shell cp -f ./gdb_logs/gdb_crash2.log ./gdb_logs/gdb_crash3.log
shell cp -f ./gdb_logs/gdb_crash1.log ./gdb_logs/gdb_crash2.log
shell cp -f ./gdb_logs/${GDB_LOG_FILENAME}.log ./gdb_logs/gdb_crash1.log
shell rm ./gdb_logs/${GDB_LOG_FILENAME}.log
set logging file ./gdb_logs/${GDB_LOG_FILENAME}.log
set logging on
handle SIG32 nostop noprint
handle SIGPIPE nostop noprint
handle SIGSEGV stop
handle SIGFPE stop
handle SIGILL stop
handle SIGABRT stop
handle SIGSYS stop
r ${GDB_PORT}
print 'crash time':
shell date >> ./gdb_logs/${GDB_LOG_FILENAME}.log
print 'crash frame:'
info f
print 'crash locals:'
info locals
print 'crash callstack:'
bt
set logging off
quit
"
