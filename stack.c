#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <unistd.h>
#include "fitsio.h"

int checkFileExists(char *fname);

#define N_MAX_FILES 100

double outimg[2048][2048];

int main(int argc, char *argv[])
{
	int i, j, f;
	int status = 0;
	int stat = 0;
	double *apix;
	fitsfile *fptr, *optr;
	long firstpix[3] = {1,1,1};
	int Nx=2048, Ny=2048;

	if (argc < 2){
		printf("No files passed, exiting...\n");
		exit(0);
	}
	else if (argc < 3) {
		printf("Need 2 or more files to stack, only found 1!\n");
		exit(1);
	}
	else if (argc > N_MAX_FILES) {
		printf("Number of files exceeds maximum number allowed (%d), exiting...\n", N_MAX_FILES);
		exit(1);
	}

	for (i=1;i<argc-1;i++){
		status = checkFileExists(argv[i]);
		if (status != 0){
			printf("File check failed for: ");
			printf(argv[i]);
			printf(", exiting...\n");
			return (status);
		}
	}

	printf("Starting stack routine...\n");


	for (i=0;i<Nx;i++){
		for (j=0;j<Ny;j++){
			outimg[i][j] = 0;
		}
	}

	apix = (double *) malloc(Nx * sizeof(double));
	for (f=1; f<argc-1; f++){
		printf("\nWorking on image: %d\n",f);
		fits_open_file(&fptr, argv[f], READONLY, &status);
		if (status) break;
		for (firstpix[1]=1;firstpix[1]<=Nx;firstpix[1]++){
			printf("\r\tLooping over rows: %d", firstpix[1]);
			if (fits_read_pix(fptr, TDOUBLE, firstpix, Nx, NULL, apix, NULL, &status)) break;
			if (status) break;
			for (i=0;i<Nx;i++){
				//printf("\t\tLooping over pixels: %d,", i);
				//printf("apix[i] = %.2f\n", apix[i]);
				outimg[firstpix[1]-1][i] += apix[i];
			}
		}
		printf("\n\tComplete.\n");
		fits_close_file(fptr, &status);
		if (status) break;
		printf("File %d closed.\n", f);
	}



	printf("Writing output image...\n");
	if (!checkFileExists("out.fits")) {
		stat = remove("out.fits");
		if (stat) {
			printf("Error deleting currunt output file out.fits, aborting...\n");
			exit(1);
		}
	}
	fits_create_file(&optr, "out.fits", &status);
	fits_open_file(&fptr, argv[1], READONLY, &status);
	fits_copy_header(fptr, optr, &status);
	fits_close_file(fptr, &status);

	if (status) {
		fits_report_error(stderr, status);
		return(status);
	}
	else {
		printf("\tOutput file initialized (status = %d)\n", status);
	}


	for (firstpix[1]=1;firstpix[1]<=Nx;firstpix[1]++){
		fits_write_pix(optr, TDOUBLE, firstpix, Nx, outimg[firstpix[1]-1], &status);
	}
	printf("\tWritten! status = %d\n", status);

	fits_close_file(optr, &status);
	printf("Output file closed!\n");
	free(apix);
	printf("Array freed!\n");

	if (status) fits_report_error(stderr, status);

	return(0);
}

int checkFileExists(char *fname)
{
	if ( access( fname, F_OK ) != -1 ){
		return(0);
	}
	else {
		return(1);
	}
}

int checkStatus(int status)
{
	if (status) {
		fits_report_error(stderr, status);
		exit(1);
	}
}