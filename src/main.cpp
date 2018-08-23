

#include <iostream>
#include <string>
#include <boost/program_options.hpp>
#include "version.h"

namespace po = boost::program_options;

void banner();
void setupOptions();


int main(int argc, char ** argv)
{
	banner();

}



void banner()
{
	std::cout << "Xanadu Virtual Machine" << __VERSION__ << std::endl;
}

// https://www.boost.org/doc/libs/1_68_0/doc/html/program_options/tutorial.html
// https://github.com/ludwig/examples/blob/master/boost/opts/multiple_sources.cpp
void setupOptions()
{
	int opt;
	
	po::options_description generic("Generic Options");
	desc.add_options()
		("version,v", "display the version")
		("help,h", "display help on options")
		("config,c",
		 po::value<string>(&opt)->default_value("./default.cfg"),
		 "path/filename to configuration file")
	;
	
	po::options_description config("Configuration");
	config.add_options()
		("memory,mx",
		 po::value<int>(&opt)-default_value(1024),
		 "available memory for virtual machine in kbytes")
	;
	
	
}
