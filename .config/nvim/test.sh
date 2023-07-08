#!/bin/bash

# Replace <font_file> with the path to your font file
font_file="$HOME/.config/fonts/berkeley-mono-typeface-trial/BerkeleyMonoRegular.ttf"

# Replace <char1> and <char2> with the characters you want to swap
char1="\\"
char2="/"

# Create temporary glyph names for the swap operation
temp1="temp_swap1"
temp2="temp_swap2"

# Run FontForge script to swap the characters
fontforge -lang=ff -c "
Open(\"$font_file\")
Select(\"$char1\")
Copy(\"$temp1\")
Select(\"$char2\")
Copy(\"$temp2\")
Select(\"$char1\")
Paste()
Select(\"$temp2\")
Paste()
Select(\"$char2\")
Paste()
Select(\"$temp1\")
Clear()
Generate(\"$font_file\")
Close()"

