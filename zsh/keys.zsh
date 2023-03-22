eval `ssh-agent -s` &> /dev/null
for key in $(ls ~/.keys/*.load); do
	ssh-add -K ${key} &> /dev/null
done
