killall -q polybar

while pgrep -u $UID -x polybar > /dev/null
do   
	sleep 1;
done

polybar -q menu -c ${HOME}/.config/devol-polybar/config.ini
