#include "pcap.h"

#include <string.h>

char *lookupdev()
{

	char *dev;
	dev = pcap_lookupdev(errbuf);

	if (dev == NULL)
	{
		set_err("Interface not found.");
	}

	return dev;
}

pcap_t	*open_live(char *dev)
{

	pcap_t *handle;

	handle = pcap_open_live(dev,BUFSIZ,1,1000, errbuf);

	if(handle == NULL)
	{
		set_err(strcat(strcat("Interface  " , dev ) ," can't be open"));
	}

	return handle;
}