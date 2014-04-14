/* This is a very simple program to create the mandelbrot set */

#include <stdio.h>
#include <fcntl.h>
#include <math.h>
#include <stdlib.h>

#define width 640
#define height 480

/*
 * Generate the Mandelbrodt set.
 * Arguments:
 * xstart, xend, ystart, yend - specify a section to focus on (for example,
 * -0.87, -0.65, -0.16, -0.05 for Valley of the Elephants)
 * iterations: the number of iterations for determining inclusion (200 is
 * good, and more = slower, but more detailed).
 */
int main(int argc, char **argv)
{
  double x,y;
  double xstart,xstep,ystart,ystep;
  double xend, yend;
  double z,zi,newz,newzi;
  double colour;
  int iter;
  long col;
  char pic[height][width][3];
  int i,j,k;
  int inset;
  int fd;
  char buffer[100];

  /* Read in the initial data */
  if (argc != 6) {
    printf("Usage: mand x0 y0 x1 y1 iter\n\n    x0 y0 x1 y1    The bounds to examine (-1 to 1)\n    iter           The number of iterations\n\n");
    return 1;
  }
  xstart = atof(argv[1]);
  ystart = atof(argv[2]);
  xend = atof(argv[3]);
  yend = atof(argv[4]);
  iter = atof(argv[5]);

  /* these are used for calculating the points corresponding to the pixels */
  xstep = (xend-xstart)/width;
  ystep = (yend-ystart)/height;

  /*the main loop */
  x = xstart;
  y = ystart;
  for (i=0; i<height; i++)
  {
    printf("Now on line: %d\n", i);
    for (j=0; j<width; j++)
    {
      z = 0;
      zi = 0;
      inset = 1;
      for (k=0; k<iter; k++)
      {
        /* z^2 = (a+bi)(a+bi) = a^2 + 2abi - b^2 */
        newz = (z*z)-(zi*zi) + x;
        newzi = 2*z*zi + y;
        z = newz;
        zi = newzi;
        if(((z*z)+(zi*zi)) > 4)
        {
          inset = 0;
          colour = k;
          k = iter;
        }
      }
      if (inset)
      {
        pic[i][j][0] = 0;
        pic[i][j][1] = 0;
        pic[i][j][2] = 0;
      }
      else
      { 
        pic[i][j][0] = colour / iter * 255;
        pic[i][j][1] = colour / iter * 255 / 2;
        pic[i][j][2] = colour / iter * 255 / 2;
      }
      x += xstep;
    }
    y += ystep;
    x = xstart;
  }

  /* writes the data to a TGA file */
  if ((fd = open("mand.tga", O_RDWR + O_CREAT, 0)) == -1)
  {
    printf("error opening file\n");
    exit(1);
  }
  buffer[0] = 0;
  buffer[1] = 0;
  buffer[2] = 2;
  buffer[8] = 0; buffer[9] = 0;
  buffer[10] = 0; buffer[11] = 0;
  buffer[12] = (width & 0x00FF); buffer[13] = (width & 0xFF00) >> 8;
  buffer[14] = (height & 0x00FF); buffer[15] = (height & 0xFF00) >> 8;
  buffer[16] = 24;
  buffer[17] = 0;
  write(fd, buffer, 18);
  write(fd, pic, width*height*3);
  close(fd);
}
