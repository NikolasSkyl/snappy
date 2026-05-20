#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <termios.h>
#include <sys/ioctl.h>

char *snappy_read_char(void) {
  struct termios old, new;
  char c;

  tcgetattr(STDIN_FILENO, &old);
  new = old;
  new.c_lflag &= ~(ICANON | ECHO);
  tcsetattr(STDIN_FILENO, TCSANOW, &new);

  if (read(STDIN_FILENO, &c, 1) != 1) {
    tcsetattr(STDIN_FILENO, TCSANOW, &old);
    return strdup("");
  }

  tcsetattr(STDIN_FILENO, TCSANOW, &old);

  char *result = (char*)malloc(2);
  result[0] = c;
  result[1] = '\0';
  return result;
}

int snappy_terminal_width(void) {
  struct winsize w;
  if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &w) == 0) {
    return w.ws_col > 0 ? w.ws_col : 80;
  }
  return 80;
}

int snappy_clear_screen(void) {
  return write(STDOUT_FILENO, "\033[H\033[J", 6);
}


int snappy_isatty(void) {
  return isatty(STDIN_FILENO);
}
