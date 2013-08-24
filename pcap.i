%module pcap


%{
	#define SWIG_FILE_WITH_INT
	#include "pcap.h"
	#include <pcap.h>
%}


%{
    /* Exception helpers */
    static int swig_c_error_num = 0;
    static char swig_c_err_msg[256];

    const char *err_occurred()
    {
        if (swig_c_error_num) {
            swig_c_error_num = 0;
            return (const char*)swig_c_err_msg;
        }
        return NULL;
    }

    void set_err(const char *msg)
    {
        swig_c_error_num = 1;
        strncpy(swig_c_err_msg, msg, 256);
    }
%}

%exception {
    const char *err;
    $action
    if (err = err_occurred()) {
        PyErr_SetString(PyExc_RuntimeError, err);
        return NULL;
    }
}


char *lookupdev();
pcap_t *open_live(char *dev);
