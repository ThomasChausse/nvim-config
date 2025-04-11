import os
import sys

# Constants (test @constant, @variable)
PI = 3.14159
APP_NAME = "Color Test"

# Classes (test @type, @constructor, @method)
class ColorTest:
    def __init__(self, name: str):
        self.name = name  # @property, @field

    def greet(self):  # @method
        print(f"Hello from {self.name}!")  # @string, @function.call

# Functions (test @function, @parameter)
def compute_area(radius: float) -> float:
    if radius < 0:  # @keyword, @conditional
        raise ValueError("Radius cannot be negative")  # @exception
    return PI * radius ** 2  # @operator, @number

# Main execution (test @keyword, @function.call)
if __name__ == "__main__":
    user = ColorTest(APP_NAME)
    user.greet()
    area = compute_area(5)
    print(f"Area: {area:.2f}")  # @string.interpolation
