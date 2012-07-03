#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import mad, ao, time, sys
from os import path
from datetime import datetime
from time import strftime, gmtime

def play(file_name):
    #if path.exists(file_name):
     #   sys.stderr.write("No file can be found!--- %s\n" % file_name)
      #  return
    media_file = mad.MadFile(file_name)
    dev = ao.AudioDevice('alsa', rate = media_file.samplerate())
    while True:
        buffer = media_file.read()
        if buffer is None:
            sys.stderr.write("The file is broken!\n")
            break
        dev.play(buffer, len(buffer))
        #print strftime("%M:%S", gmtime())
        #print datetime.time(datetime.now())

def main():
    play(sys.argv[1])
if __name__ == '__main__':
    main()
