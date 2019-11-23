#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "timer.h"
#include <string.h>

double sigclip(int i);
void readData(int i);
double array[100][1000];

int main()
{
	int length = 1000;
	double hold;
	int i=0;
	long ticks0, ticks1, dticks;
	FILE *fin;
	double output[1000];
	double err, clip_mean;
	double values[1000];

	printf("Reading data files...\n");

	for (i=0;i<100;i++){
		readData(i);
	}

	err = 0.0;
	ticks0 = getticks();
	printf("Starting sigma clipping computation...\n");
	for (i=0;i<1000;i++){;
		clip_mean = sigclip(i);
		err += pow(clip_mean - output[i],2.0);
	}
	ticks1 = getticks();
	dticks = (ticks1-ticks0);
	printf("Clock cycles: %ld\n", dticks);
	
	return(0);
}

void readData(int i)
{
	double hold;
	char fname[50];
	FILE *fin;
	int idx = 0;

	sprintf(fname, "data/data%d.txt", i+1);

	printf("\treadData: i=%d, ",i);
	printf("fname=%s\n",fname);

	if ( (fin = fopen(fname, "r")) != NULL ) {
		while ( fscanf(fin, "%lf", &hold) != EOF ) {
			array[i][idx] = hold;
			idx++;
		}
	}
	else {
		printf("Failed to open file: %s", fname);
		exit(1);
	}
	fclose(fin);

	return;
}
		
double sigclip(int I)
{
	double uplim, lowlim;
	double mean = 0.0;
	double std = 0.0;
	double diff[1000];
	double maxdiff = 0.0;
	int i=0;
	int idx=10;

	printf("\tClipping for array: %d\n", I);

	for (i=0;i<100;i++) mean += array[i][I]/100. ;
	printf("\t\tMean computed: %lf\n", mean);
	for (i=0;i<100;i++) {
		diff[i] = ( array[i][I] - mean);
		std += (diff[i]*diff[i]);
		if ( fabs(diff[i]) > maxdiff ){
			maxdiff = fabs(diff[i]);
			idx = i;
		}
	}
	
	if (idx==10){
		printf("Error computing maxdiff! Aborting...\n");
		exit(1);
	}

	std = sqrt( std / 99.);
	uplim = mean + 3.0*std;
	lowlim = mean - 3.0*std;
	if ( (diff[idx] > uplim) || (diff[idx] < lowlim) ) {
		mean = 0.0;
		for (i=0;i<100;i++){
			if (i!=idx) mean += array[i][I]/99.;
		}
		return(mean);
	
	}
	else return(mean);
}
