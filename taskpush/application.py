# -------------------------------------------------------
# Task programm by Ramil Mustafin
#
#
# Version       Date
# 1.0           17.12.2021
#
# -------------------------------------------------------

from flask import Flask, Response, render_template_string
from datetime import datetime
import pytz
import time

application = Flask(__name__)


MOS = pytz.timezone('Europe/Moscow')
now = datetime.now(MOS) # current date and time
date_time = now.strftime("%H:%M:%S")

@application.route('/')
def time_feed():
    def generate():
        yield (datetime.now(MOS).strftime("Привет, Всем! Time is: %H:%M:%S"))
    return Response(generate())

if __name__=="__main__":
    application.run(host="0.0.0.0", port=5000)
