#!/bin/bash
7z d -r -tzip kart-builder.aseprite-extension *.*
7z a -r -tzip kart-builder.aseprite-extension package.json *.lua
7z d -r -tzip kart-builder.zip *.*
7z a -r -tzip kart-builder.zip kart-builder.aseprite-extension *.ase *.ogg
