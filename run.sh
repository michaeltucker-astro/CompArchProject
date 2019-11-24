#! /bin/bash 

machine=
Niter=1000

while [ "$1" != '' ]; 
do
	case $1 in 
		--machine | -m 		)	shift
								machine=$1
								;;
		--niter | -n		)	shift
								Niter=$1
								;;
		--help | -h			)	usage
								exit 0
								;;
		*					)	echo "Unrecognized argument: $1; see --help for details"
								exit 1
								;;
	esac
	shift
done

case $machine in 
	mac|laptop|osu		)	echo "Machine: $machine"
							;;
	''					)	echo "Need to pass machine name (-m/--machine)"
							exit 1
							;;
	*					)	echo "Machine $machine not recognized, must be mac|laptop|osu"
							exit 1
							;;
esac

for exe in 'clipO0' 'clipO1' 'clipO2' 'clipO3' 
do
	if [ ! -e "$exe" ]; then
		echo "Cannot find executable $exe, maybe need to run make?"
		exit 1
	fi
done

for opt in 0 1 2 3
do

	outfile="output/clocksO$opt.$machine"
	exe="./clipO$opt"
	echo "Starting runs for optimization level $opt ($exe), outfile=$outfile, Niter=$Niter"
	for ((i=0;i<$Niter;i++)) do
		clocks=`$exe | awk '{print $2}'`
		echo $clocks >> $outfile
	done
done
