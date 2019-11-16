#! /bin/bash

cmd="gdate +%s%N"

for i in {1..1000}
do
	$cmd >> times.list
done

