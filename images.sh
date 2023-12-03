#!/bin/bash
#

#wget https://github.com/robinmordasiewicz.png -O robinmordasiewicz.png
#cat robinmordasiewicz.png | convert - -alpha off -resize 256x256 -define icon:auto-resize="256,128,96,64,48,32,16" favicon.ico
curl https://api.openai.com/v1/images/generations \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
    "model": "dall-e-3",
    "style": "natural",
    "prompt": "Create a minimalist style text only logo design. Only use an area of 72 pixels high and 256 pixels wide.The logo is written with the exact text \"Multi Cloud SE\". The stlye of the text should be prominent, clear, and bold. The design should sit against a transparent background for versatile use. Outline the full design with a delicate one-pixel border in a vibrant orange color to give it a distinctive edge.",
    "n": 1,
    "size": "1024x1024",
    "response_format":"b64_json"
  }' > output.json
cat output.json | jq -r '.data[0].b64_json' | base64 -d | convert - output.png
open output.png
  #}' | jq -r '.data[0][]' | base64 -d | convert - -alpha off -resize 256x256 -define icon:auto-resize="256,128,96,64,48,32,16" favicon.ico

exit 0


curl https://api.openai.com/v1/images/generations \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
    "model": "dall-e-2",
    "prompt": "Within black sqaure, draw an infinity loop in solid bright orange. Make sure the inifity loop fits within the canvas. Make the background color black. Draw an orange one pixel border around the outer edge of the image.",
    "n": 1,
    "size": "256x256",
    "response_format":"b64_json"
  }' | jq -r '.data[0][]' | base64 -d | convert - output.png
  #}' | jq -r '.data[0][]' | base64 -d | convert - -alpha off -resize 256x256 -define icon:auto-resize="256,128,96,64,48,32,16" favicon.ico

#jq -r '.data[0][]' | base64 -d | convert - -alpha off -resize 256x256 -define icon:auto-resize="256,128,96,64,48,32,16" favicon.ico

# convert output.png -resize 16x16 -background none -flatten output.ico
