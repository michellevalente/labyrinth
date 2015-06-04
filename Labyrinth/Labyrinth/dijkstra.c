#include <stdio.h>
#include "vga_led.h"
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

int vga_led_fd;

/* Write the contents of the array to the display */
void write_segments(unsigned int segs)
{
  vga_led_arg_t vla;
  int i;
  for (i = 0 ; i < VGA_LED_DIGITS ; i = i+1) {
    vla.digit = i; 
    vla.segments = segs;
    if (ioctl(vga_led_fd, VGA_LED_WRITE_DIGIT, &vla)) {
      perror("ioctl(VGA_LED_WRITE_DIGIT) failed");
      return;
    }
  }
}

int main()
{
  vga_led_arg_t vla;
  static const char filename[] = "/dev/vga_led";
  unsigned int message;	
	
	printf("\nLabyrinth Userspace program started\n");
	if ( (vga_led_fd = open(filename, O_RDWR)) == -1) {
   		fprintf(stderr, "could not open %s\n", filename);
    	return -1;
  	}
		message = 2147483680;      //32
		printf("\n%u\n", message);

		write_segments(message);

		usleep(1000000);
		
		int u;		
		for (u = 0; u < 32; u++){
			message = 163860;            //20 (1st) 5 (2nd)
			write_segments(message);
			
			printf("\n%u\n", message);			
			
			usleep(1000000);

			message = 1073774602;   //10(3rd) 1 (4th)
			write_segments(message);

			printf("\n%u\n", message);				

			usleep(1000000);
		}

		usleep(3000);
	
  
  printf("\nLabyrinth Userspace program terminating\n");
  return 0;
}
