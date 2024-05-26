#!/bin/bash
rm kart-builder.aseprite-extension kart-builder.zip
7z a -r -tzip kart-builder.aseprite-extension package.json *.lua src/*.lua
7z a -r -tzip kart-builder.zip kart-builder.aseprite-extension *.ase *.ogg **/*.ogg
