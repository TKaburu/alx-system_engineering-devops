#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>


/**
 * infinite_while - This function creates an infinite loop
 *
 * Return: 0 if successful
 */


int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - This is the entry point of the program
 *
 * Return: 0 if successful
 */


int main(void)
{
	int zombies = 0;
	pid_t babe;

	while (zombies < 5)
	{
		babe = fork();
		if (babe == 0)
		{
			printf("Zombie process created, PID: %d\n", getpid());
			exit(0);
		}
		zombies++;
	}
	infinite_while();
	return (0);
}

