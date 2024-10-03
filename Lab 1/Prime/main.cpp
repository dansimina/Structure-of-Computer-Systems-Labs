#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <windows.h>
#include <chrono>

unsigned long* numbers;
typedef struct MyData {
    unsigned long start;
    unsigned long len;
} MYDATA, *PMYDATA;
DWORD WINAPI MyThreadFunction(LPVOID lpParam);

int is_prime(unsigned long n)
{

	for (unsigned long i=2; i<n; i++)
	{
		if (n % i == 0) return 0;
	}
	return 1;
}

int main(int argc, char* argv[])
{
	unsigned long lEnd, failure, mult, len, nThreads;
	unsigned long i;
	HANDLE*  hThreadArray;
	DWORD*   dwThreadIdArray;
	PMYDATA* pDataArray;

    if (argc != 3) {
		printf("Provide the upper limit: ");
		scanf("%lu", &lEnd);

		printf("Provide the number of threads: ");
		scanf("%lu", &nThreads);

		// lEnd = 100000;
		// nThreads = 1;
    }
	else {
		lEnd = atol(argv[1]);
		nThreads = atol(argv[2]);
	}

	hThreadArray = new HANDLE[nThreads];
	dwThreadIdArray = new DWORD[nThreads];
	pDataArray = new PMYDATA[nThreads];

	len = lEnd-1;

	numbers = new unsigned long[len];

	for (i=0; i<len; i++)
	{
		numbers[i] = i+2;
	}

	auto start = std::chrono::high_resolution_clock::now();
	for(i=0;i<nThreads;i++)
	{

		pDataArray[i] = (PMYDATA) HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY,sizeof(MYDATA));
		pDataArray[i]->len = len/nThreads;
		pDataArray[i]->start = i*len/nThreads;
		if(i==nThreads-1)
		{
			pDataArray[i]->len += len-(len/nThreads+i*len/nThreads);
		}
		hThreadArray[i] = CreateThread(NULL, 0,MyThreadFunction,pDataArray[i],0,&dwThreadIdArray[i]);
	}

	WaitForMultipleObjects(nThreads, hThreadArray, TRUE, INFINITE);

	//No threads
	// PMYDATA data = (PMYDATA) HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, sizeof(MYDATA));
	// data->len = len;
	// data->start = 0;
	// MyThreadFunction(data);

	auto stop = std::chrono::high_resolution_clock::now();


	for(int i=0; i<nThreads; i++)
	{
		CloseHandle(hThreadArray[i]);
		if(pDataArray[i] != NULL)
		{
			HeapFree(GetProcessHeap(), 0, pDataArray[i]);
			pDataArray[i] = NULL;
		}
	}

	for (i=0; i<len; i++)
	{
		if(numbers[i] > 0)
		{
			printf("%d\n", numbers[i]);
		}
	}

	printf("Time: %f\n", std::chrono::duration<double>(stop-start).count());

	delete[] numbers;
	delete[] hThreadArray;
	delete[] dwThreadIdArray;
	delete[] pDataArray;

	failure = 0;

    return failure;
}

DWORD WINAPI MyThreadFunction(LPVOID lpParam)
{
	PMYDATA pDataArray;
	pDataArray = (PMYDATA)lpParam;

	unsigned long k, mult, j;
	for (k=pDataArray->start; k<pDataArray->start+pDataArray->len; k++)
		{
			if(is_prime(numbers[k]) == 1)
			{
				for (j=2*numbers[k]-2;j<pDataArray->len;j+=numbers[k])
				{
					numbers[j] = 0;

				}
			}
			else{numbers[k] = 0;}
		}
	return 0;
}