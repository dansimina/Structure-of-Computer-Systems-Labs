#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#define rdtsc __asm __emit 0fh __asm __emit 031h 
#define cpuid __asm __emit 0fh __asm __emit 0a2h
#define FREQUENCY 2800000000 // 2.8 GHz (change based on your PC frequency)
#define RUNS 10

void sort(unsigned a[], int n) {
	// implement the sort function
}

void generate_random_array(unsigned a[], int n) {
	srand((unsigned)time(NULL));

	for (int i = 0; i < n; i++) {
		a[i] = (unsigned)(rand() % 1000);
	}
}

void print_array(unsigned a[], int n) {
	for (int i = 0; i < n; i++) {
		printf("%u ", a[i]);
	}
	printf("\n");
}

void optimized_sort(unsigned a[], int n) {
	// implement the sort optimized version of the sort function or a more efficien sort function
}

int main() {

	unsigned cycles_high1 = 0, cycles_low1 = 0, cpuid_time = 0;
	unsigned cycles_high2 = 0, cycles_low2 = 0;
	unsigned __int64 temp_cycles1 = 0, temp_cycles2 = 0;
	double avg_cycles = 0.0, avg_seconds = 0.0, total_seconds = 0.0;
	__int64 total_cycles = 0;
	int n = 100;
	unsigned a1[100];
	unsigned* a2 = (unsigned*)malloc(n * sizeof(unsigned));

	for (int i = 1; i <= RUNS; i++) {
		// compute the CPUID overhead 
		__asm {
			; call the cpuid instruction three times and use the value generated by the 3rd call
			pushad
			cpuid
			rdtsc
			mov cycles_high1, edx
			mov cycles_low1, eax
			popad
			pushad
			cpuid
			rdtsc
			popad

			pushad
			cpuid
			rdtsc
			mov cycles_high1, edx
			mov cycles_low1, eax
			popad
			pushad
			cpuid
			rdtsc
			popad

			pushad
			cpuid
			rdtsc
			mov cycles_high1, edx
			mov cycles_low1, eax
			popad
			pushad
			cpuid
			rdtsc
			sub eax, cycles_low1
			mov cpuid_time, eax
			popad
		}

		// reset the values of cycles_high1 and cycles_low1
		cycles_high1 = 0;
		cycles_low1 = 0;

		// measure the code sequence
		__asm {
			pushad
			cpuid
			rdtsc
			mov cycles_high1, edx
			mov cycles_low1, eax
			popad
		}

		sort(a1, n);
		// after measuring the execution time for both a1 and a2 using the sort function, do the same thiing for the optimized version of the sort function

		__asm {
			pushad
			cpuid
			rdtsc
			mov cycles_high2, edx
			mov cycles_low2, eax
			popad
		}
		temp_cycles1 = ((unsigned __int64)cycles_high1 << 32) | cycles_low1;
		temp_cycles2 = ((unsigned __int64)cycles_high2 << 32) | cycles_low2;
		total_cycles = temp_cycles2 - temp_cycles1 - cpuid_time;
		avg_cycles += total_cycles;
	}

	// compute the average execution time in cycles and seconds
	avg_cycles /= (double)RUNS;
	avg_seconds = avg_cycles / FREQUENCY;

	total_seconds = (double)total_cycles / FREQUENCY;

	printf("Average cycles = %lf\n", avg_cycles);
	printf("Average seconds = %lf\n", avg_seconds);
	printf("Cycles (last run) = %lld\n", total_cycles);
	printf("Seconds (last run) = %lf\n", total_seconds);

	return 0;
}