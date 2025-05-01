import matplotlib.pyplot as plt
import numpy as np

# Settings
screen_width = 640
screen_height = 480

# Color map: match the labels we saved in pixel_colors.txt
color_map = {
    "Red": (1.0, 0.0, 0.0),
    "Yellow": (1.0, 1.0, 0.0),
    "Blue": (0.0, 0.0, 1.0),
    "White (Ball)": (1.0, 1.0, 1.0),
    "Green (Paddle)": (0.0, 1.0, 0.0),
}

# Initialize blank black screen
image = np.zeros((screen_height, screen_width, 3))

# Read pixel_colors.txt
with open('pixel_colors.txt', 'r') as file:
    lines = file.readlines()

for line in lines:
    # Example: (50,60): Red
    line = line.strip()
    if not line:
        continue

    # Parse the line
    coord_part, color_part = line.split(":")
    coord_part = coord_part.strip("()")
    x_str, y_str = coord_part.split(",")
    x = int(x_str)
    y = int(y_str)
    color = color_part.strip()

    if color in color_map:
        # Remember: in numpy image arrays, the first index is Y (row), second is X (col)
        image[y, x] = color_map[color]

# Plot the result
plt.figure(figsize=(8, 6))
plt.imshow(image)
plt.title("Breakout VGA Simulation (Blocks + Paddle + Ball)")
plt.axis('off')
plt.show()
