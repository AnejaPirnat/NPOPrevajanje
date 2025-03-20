#include <stdio.h>

#define PES "Hov"

#ifdef PES
    #define PES "Zna lajat"
#endif

void
izpis(char *hov)
{
    printf("%s\n", hov);
}

int
main()
{
    izpis(PES);

    return 0;
}
