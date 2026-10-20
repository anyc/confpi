function add_model_settings() {
	local model="$1"
	local model_dir="${SCRIPTDIR}/pi${model}"
	local -n model_lines="MODEL_LINES_${model}"

	printf '\n# RPi%s-specific settings\n[pi%s]\n' "${model}" "${model}" >> "${CFG}"

	if [ -d "${model_dir}" ]; then
		for script in "${model_dir}"/*.sh; do
			[ -x "${script}" ] || continue
			source "${script}"
		done

		for line in "${model_lines[@]}"; do
			add_line "${line}"
		done
	fi
}

for model_dir in "${SCRIPTDIR}"/pi[0-9]*/; do
	[ -d "${model_dir}" ] || continue
	model="${model_dir%/}"
	model="${model##*/}"
	model="${model#pi}"
	[[ "${model}" =~ ^[0-9]+$ ]] || continue
	add_model_settings "${model}"
done

printf '\n# reset filter\n[all]\n' >> "${CFG}"
