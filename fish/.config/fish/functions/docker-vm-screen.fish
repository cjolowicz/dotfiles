# Defined in - @ line 1
function docker-vm-screen --description 'alias docker-vm-screen=screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty'
	screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty $argv;
end
