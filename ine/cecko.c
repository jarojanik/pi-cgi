#include <stdio.h>

int main()
{
/* Print CGI response header, required for all HTML output. Note the extra \n, to send the blank line. */
printf("Content-type: text/html\n\n") ;
/* Now print the HTML response. */
printf("<html>\n");
printf("<head><title>Hello world</title></head>\n");
printf("<body>\n");
printf("<h1>Hello, world z cecka</h1>\n") ;
printf("</body>\n");
printf("</html>\n");
//exit(0);
}

