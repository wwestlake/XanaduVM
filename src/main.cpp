

#include <iostream>
#include <string>
#include "version.h"

void banner();


int main(int argc, char ** argv)
{
	banner();

}



void banner()
{
	std::cout << "Xanadu Virtual Machine" << __VERSION__ << std::endl;

}
