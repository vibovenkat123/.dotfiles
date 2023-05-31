#!/usr/bin/env python
import datetime
import os
from time import sleep
import openai
import subprocess
openai.api_key = os.getenv("OPENAI_API_KEY")
def clear():
    os.system('clear')
def get_msg() -> str:
    print("Generating content...")
    now = datetime.datetime.now()
    month = now.strftime("%B").upper()
    day = now.strftime("%d")
    sys_content = 'You take in a date and ONLY reply with a special message for that date (e.g, "MAY THE FOURTH BE WITH YOU") only reply with that NOTHING else'
    chat_completion = openai.ChatCompletion.create(model = "gpt-4", messages=[{"role": "system", "content": sys_content}, {"role": "user", "content": f"date: {month} {day}"}])
    neofetch_out =  output = subprocess.check_output(['neofetch'], stderr=subprocess.STDOUT)
    output = neofetch_out.decode('utf-8')
    clear()
    return f"""
{month} {day}

AI SAYS:
{chat_completion.choices[0].message.content.upper()}


{output}
    """.strip()
clear()
print(get_msg())
while True:
    sleep(1)
