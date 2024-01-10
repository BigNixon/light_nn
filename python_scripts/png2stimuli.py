from PIL import Image
import numpy as np

def extract_centered_7x7_luminance(filename):
    # Open the image file
    img = Image.open(filename).convert('L')  # convert image to grayscale
    pixels = np.array(img)

    # Get the center 7x7 segment
    start_row = pixels.shape[0] // 2 - 3
    start_col = pixels.shape[1] // 2 - 3
    segment = pixels[start_row:start_row+7, start_col:start_col+7]

    # Write the luminance values to a text file
    with open('luminance.txt', 'w') as f:
        for row in segment:
            # Convert each pixel value to an 8-bit binary string
            binary_row = [format(pixel, '08b') for pixel in row]
            # Join the binary strings into a single 56-bit string
            f.write(''.join(binary_row) + '\n')

def extract_all_luminance(input_filename, output_filename):
    # Open the image file
    img = Image.open(input_filename).convert('L')  # convert image to grayscale
    pixels = np.array(img)

    # Write the luminance values to a text file
    with open(output_filename, 'w') as f:
        for row in pixels:
            for pixel in row:
                # Convert each pixel value to an 8-bit binary string
                binary_pixel = format(pixel, '08b')
                f.write(binary_pixel + '\n')


def rgb_txt_to_png(input_filename, output_filename, img_size):
    # Initialize an empty list to store the pixel data
    pixels = []

    # Read the RGB values from the text file
    with open(input_filename, 'r') as f:
        for line in f:
            # Convert the 24-bit binary string to an RGB tuple
            r = int(line[0:8], 2)
            g = int(line[8:16], 2)
            b = int(line[16:24], 2)
            pixels.append((r, g, b))

    # Convert the list of pixels to a numpy array
    pixels = np.array(pixels, dtype=np.uint8).reshape(img_size)

    # Create the image
    img = Image.fromarray(pixels, 'RGB')
    img.save(output_filename)

def main():
    # extract_centered_7x7_luminance('ex_11.png')
    # extract_all_luminance('1280_720.png', 'all_luminance.txt')
    rgb_txt_to_png('rgb_out_3.txt', 'output.png', (720, 1280, 3))

if __name__ == "__main__":
    main()