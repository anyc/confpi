
echo -n "
# RPi2-specific settings
[pi2]
" >> "${CFG}"

if [ -d "${SCRIPTDIR}"/pi2/ ]; then
	for y in "${SCRIPTDIR}"/pi2/*.sh; do
		[ -x "${y}" ] || continue
		source "${y}"
	done
	
	for line in "${MODEL_LINES_2[@]}"; do
		add_line $line
	done
fi

echo -n "
# RPi3-specific settings
[pi3]
" >> "${CFG}"

if [ -d "${SCRIPTDIR}"/pi3/ ]; then
	for y in "${SCRIPTDIR}"/pi3/*.sh; do
		[ -x "${y}" ] || continue
		source "${y}"
	done
	
	for line in "${MODEL_LINES_3[@]}"; do
		add_line $line
	done
fi

echo -n "
# RPi4-specific settings
[pi4]
" >> "${CFG}"

if [ -d "${SCRIPTDIR}"/pi4/ ]; then
	for y in "${SCRIPTDIR}"/pi4/*.sh; do
		[ -x "${y}" ] || continue
		source "${y}"
	done
	
	for line in "${MODEL_LINES_4[@]}"; do
		add_line $line
	done
fi

echo -n "
# reset filter
[all]
" >> "${CFG}"
