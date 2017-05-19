# bring down servers in descending order as a discipline for advanced restarting

gfsh <<!

connect --locator=localhost[10335]

stop server --name=server3

shutdown --include-locators=true
Y

exit;
!

