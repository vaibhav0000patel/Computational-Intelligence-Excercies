import pytesseract
from PIL import Image

# Load the image from file
img_path = '10_2.png'
img = Image.open(img_path)

# Use tesseract to do OCR on the image
text = pytesseract.image_to_string(img)

print(text)
