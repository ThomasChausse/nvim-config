// @comment: This is a comment
// TODO:

#include <stdint.h> // @include
#include <stdio.h>  // @include
#define PI 3.14159  // @constant, @macro

// @type: typedef
typedef struct {
  int id;
  const char *name;
} User;

// @function
void greet(User *user) {
  printf("Hello, %s!\n", user->name); // @string, @function.call, @field
}

// @function
int compute_area(int radius) {
  // @conditional, @number, @operator
  if (radius <= PI) {
    return -1;
  }
  int area = PI * radius * radius; // @variable, @operator
  return area;
}

int main(void) {
  // @type.builtin, @variable
  User me = {.id = 1, .name = "Thomas"};

  // BUG:
  greet(&me);

  // @function.call, @number
  int result = compute_area(5);

  // @string
  printf("Area is: %d\n", result);

  // @keyword
  return 0;
}
