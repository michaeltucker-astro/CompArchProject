#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <unistd.h>
int checkFileExists(char *fname);

#define N_MAX_FILES = 1000;

int main(int argc, char *argv[])
{
	int i;
	int status = 0;

	if (argc < 2){
		printf("No files passed, exiting...\n");
		exit(0);
	}
	else if (argc > N_MAX_FILES) {
		printf("Number of files exceeds maximum number allowed (%d), exiting...\n", N_MAX_FILES);
		exit(1);
	}

	for (i=1;i<argc;i++){
		status = checkFileExists(argv[i]);
		if (status != 0){
			printf("File check failed for: ");
			printf(argv[i]);
			printf(", exiting...\n");
			return (status);
		}		
	}



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

