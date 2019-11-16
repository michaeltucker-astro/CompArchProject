#! /bin/bash

#defaults 
niter=10
Nstart=2
Nend=1000
Nstep=1
outff="times.list"


function usage()
{
	echo "Script to time the execution of stack for various numbers of files"
	echo "The script iterates though sets of FITS files of varying lengths and times the code execution."
	echo "Arguments:"
	echo -e "\t--niter/-n: Number of iterations to run *per file set*, eg. run the stack on 5 images niter number of times. Default: $niter"
	echo -e "\t--start/-S: starting number of files to stack. Default: $Nstart"
	echo -e "\t--end/-E: end number of files to stack. Default: $Nend"
	echo -e "\t--step/-s: step size for number of files to stack."
	echo -e "\t--output/-o: file to place the timing results. Default: $outff"
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
		--output | -o )		shift
							outff=$1
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
elif [ `uname -n` = 'tacoma' ]; then
	#on local cluster
	cmd="date +%s%N"
	fitsdir="/data/poohbah/1/assassin/Stacks/RESUB"
elif [ `uname -n` = 'poohbah' ]; then
	# on the OSU servers
	cmd="date +%s%N"
	fitsdir="/data/poohbah/1/assassin/Stacks/RESUB"
else
	#linux laptop
	cmd="date +%s%N"
	fitsdir="/home/michael/Documents/LightEchoes/RESUB"
fi

check_date="2019-10-11T11:12:12"
check_time=1570828332000000000

if [ ! -d $fitsdir ]; then
	echo "Cannot find FITS input directory! Expected: $fitsdir"
	exit 1
elif [ ! `$cmd -d $check_date` = $check_time ]; then
	echo "Time verification failed! Aborting..."
	exit 1
fi

echo "All quality checks passed, loading filenames..."

find $fitsdir -name "*.fits" > tmp.files
Nfiles=`wc -l tmp.files | awk '{print $1 }'`
if [ "$Nfiles" -lt "$Nend" ]; then
	echo "Not enough files found (Nfiles=$Nfiles) for requested end value (Nend=$Nend)!"
	exit 1
else
	echo -e "\tFound $Nfiles FITS files"
fi

if [ -e $outff ]; then
	echo "output file $outff already exists, abort? [y/n] >"
	read resp
	if [ "$resp" = 'y' ]; then
		exit 1
	else
		rm $outff
	fi
fi


echo "Starting stack timing procedure:"
echo "Nstart=$Nstart, Nend=$Nend, Nstep=$Nstep"

while [ "$Nstart" -lt "$Nend" ]
do
	echo "#Nstack = $Nstart" >> $outff
	echo -e "\tWorking Nstack = $Nstart"

	stackcmd="./stack `head -n $Nstart tmp.files`"
	for ((i=0;i<$niter;i++)); do
		
		start=`$cmd`
		$stackcmd > /dev/null
		end=`$cmd`
		if [ $? != 0 ]; then
			echo "ERROR: stck returned non-zero status code $?"
			exit 1
		fi
		diff=`echo "($end-$start)/1000000000." | bc -l`
		echo "$diff" >> $outff
	done

	Nstart=`echo "$Nstart+$Nstep" | bc`
done
rm tmp.files
echo "timing routine complete."

