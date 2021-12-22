#!/usr/bin/env python
import beepy
import signal
import time
import logging
from datetime import datetime

FORMAT = '%(asctime)s:%(levelname)s:%(message)s'
logging.basicConfig(format=FORMAT)

STOP_EVENT = False
def signal_handler(signum, frame):
    global STOP_EVENT
    STOP_EVENT = True

signal.signal(signal.SIGINT, signal_handler)
signal.signal(signal.SIGTERM, signal_handler)

# Hourly sessions starting with 10am, breaking at 40min and ready 5 minutes to.
BREAK_MINUTES = 40
READY_MINUTES = 57
IMMINENT_MINUTES = 59
IMMINENT_SECONDS = 59

start_counter = 0
break_counter = 0
ready_counter = 0
imminent_counter = 0

def now_exceeds(counter, minute = 0):
    now = datetime.now()
    return ((counter + 1) % 24) <= now.hour and minute <= now.minute

def output_debug():
    logging.debug(f"start_counter={start_counter}")
    logging.debug(f"break_counter={break_counter}")
    logging.debug(f"ready_counter={ready_counter}")
    logging.debug(f"imminent_counter={imminent_counter}")

def init():
    now = datetime.now()
    global start_counter
    global break_counter
    global ready_counter
    global imminent_counter

    start_counter = now.hour
    break_counter = (now.hour
            if now_exceeds(break_counter, BREAK_MINUTES)
            else now.hour - 1)
    ready_counter = (now.hour
            if now_exceeds(ready_counter, READY_MINUTES)
            else now.hour - 1)
    imminent_counter = (now.hour
            if now_exceeds(ready_counter, IMMINENT_MINUTES)
            else now.hour - 1)
    output_debug()

logging.getLogger().setLevel(logging.DEBUG)
init()

while not STOP_EVENT:
    hour = datetime.now().hour

    if now_exceeds(start_counter):
        beepy.beep('ready')
        start_counter = hour
        output_debug()

    if now_exceeds(break_counter, BREAK_MINUTES):
        beepy.beep('ping')
        break_counter = hour
        output_debug()

    if now_exceeds(ready_counter, READY_MINUTES):
        beepy.beep('coin')
        ready_counter = hour
        output_debug()

    if now_exceeds(imminent_counter, IMMINENT_MINUTES):
        for _ in range(2):
            beepy.beep('coin')
        imminent_counter = hour
        output_debug()

    time.sleep(1)
