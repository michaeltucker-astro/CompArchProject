#! /bin/bash

#defaults 
niter=10
Nstart=2
Nend=1000
Nstep=1


function usage()
{
	echo "Script to time the execution of stack for various numbers of files"
	echo "The script iterates though sets of FITS files of varying lengths and times the code execution."
	echo "Arguments:"
	echo -e "\t--niter/-n: Number of iterations to run *per file set*, eg. run the stack on 5 images niter number of times. Default: $niter"
	echo -e "\t--start/-S: starting number of files to stack. Default: $Nstart"
	echo -e "\t--end/-E: end number of files to stack. Default: $Nend"
	echo -e "\t--step/-s: step size for number of files to stack."
}
	

while [ "$1" != '' ]
do
	case $1 in 
		--niter | -n )		shift
							niter=$1
							;;
		--start | -S )		shift
							Nstart=$1
							;;
		--end | -E   )		shift 
							Nend=$1
							;;
		--step | -s  )		shift
							Nstep=$1
							;;
		--help | -h	 )		usage
							exit 0
							;;
		* 			)		echo "Unrecognized argument: $1"
							echo "See --help for details"
							exit 1
							;;
	esac
	shift
done

#check args
if [ $Nstart -lt 2 ]; then
	echo "Number of starting images must be >=2, got $Nstart"
	exit 1
elif [ $Nend -gt 1000 ]; then
	echo "Number of end images must be <= 1000, got $Nend"
	exit 1
elif [ $Nstart -gt $Nend ]; then
	echo "Start value > end value!"
	exit 1
elif [ $Nstep -lt 0 ]; then
	echo "Step size must be > 0, got $Nstep"
	exit 1
else
	echo "Arg check passed."
fi
		
#check system and set file locations and cmd defaults

if [ `uname` = 'Darwin' ]; then
	# on the mac desktop
	cmd="gdate +%s%N"
	fitsdir="/Users/skywalker/Documents/Science/LightEcho/RESUB"
	machine='mac'
elif [ `uname -n` = 'tacoma' ]; then
	#on local cluster
	cmd="date +%s%N"
	fitsdir="/data/poohbah/1/assassin/Stacks/RESUB"
	machine='cluster'
elif [ `uname -n` = 'poohbah' ]; then
	# on the OSU servers
	cmd="date +%s%N"
	fitsdir="/data/poohbah/1/assassin/Stacks/RESUB"
	machine='osu'
else
	#linux laptop
	cmd="date +%s%N"
	fitsdir="/home/michael/Documents/LightEchoes/RESUB"
	machine='laptop'
fi

case $machine in
	laptop | osu | cluster 	) mtype='linux' ;;
	mac 					) mytpe='mac' ;;
	*						) echo "Error parsing machine name: $machine"
							  exit 1
							  ;;
esac


stypes=( double float int scaled )

for stype in ${stypes[@]}; do
	cmd="./bin/stack_$stype --start $Nstart --end $Nend --step $Nstep --mtype $mtype -o output/times_$stype.$machine"
	optcmd="./bin/stack_${stype}O3 --start $Nstart --end $Nend --step $Nstep --mtype $mtype -o output/time_${stype}O3.$machine"
	echo "cmd=$cmd"
	echo "optcmd=$optcmd"
done
