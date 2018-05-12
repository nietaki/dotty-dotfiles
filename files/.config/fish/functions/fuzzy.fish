function fuzzy
	set all $argv[1..200]
	# set first $argv[1]
	#
	# echo $first
	# echo $all
	#
	# set moar " -e "$all
	# echo $moar
	# set search "ag -i --nogroup --nocolor --column"
	# # eval "$search $first" | grep "-e foo"
	# # eval "$search $first" | eval "grep $moar"
	# set moar echo ","$all | tr -d ' '
	# set moar (string join "," $all)
	# echo $moar

	# eval "$search $first" | eval "grep \"$moar\""
	# eval "$search $first | grep $moar"

	set es " -e "$all
	# echo $es
	set pattern (string join " --and " $es)
	# echo $pattern

	eval "git grep -i -n $pattern ."
	# echo "last"
end
