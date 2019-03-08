#!/bin/bash

rofi -show window \
     -kb-cancel 'Alt+Escape,Escape' \
     -kb-accept-entry '!Alt+Tab,Return' \
     -kb-row-down 'Alt+Tab,Alt+Down' \
     -kb-row-up 'Alt+Shift+Tab,Alt+Up' & 

sleep 0.04

xdotool search --class Rofi key alt+Tab
