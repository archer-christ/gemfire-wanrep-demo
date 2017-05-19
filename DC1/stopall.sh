# bring down servers in descending order as a discipline for advanced restarting

gfsh <<!

connect --locator=localhost[10334]

stop server --name=server1

shutdown --include-locators=true
Y

exit;
!

