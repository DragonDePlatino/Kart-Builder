<img src="screenshots/template.png" align="center">
<h3 align="center">
	<a href="https://github.com/DragonDePlatino/Kart-Builder/releases/latest/download/kart-builder.zip">DOWNLOAD</a>
</h3>
An aseprite extension for drawing, previewing and exporting racers for Dr. Robotnik's Ring Racers.

## Table of Contents

* [Setup](docs/Setup.md)
* [Template](docs/Template.md)
* [Exporting](docs/EXPORTING.md)
* [Graphics](docs/GRAPHICS.md)

## Prerequisites

- [Aseprite](https://www.aseprite.org/) (minimum version: v1.3-rc1)
- [7-Zip](https://www.7-zip.org/download.html)

## Installation

1. Grab the [latest release](https://github.com/DragonDePlatino/Kart-Builder/releases/latest/download/kart-builder.zip).
2. Double-click on the `kart-builder.aseprite-extension` to install it.

For alternate installation methods, consult the [aseprite documentation](https://www.aseprite.org/docs/extensions/).

## Exporting

1. Open `File > Export > Export Kart` to open the **Export Kart** dialog. 
2. Click `[...]` in the lower-right and specify an output path.
3. Click `Save` to write a `*.pk3` to that location.

## Editing

Kart Builder uses a special `*.ase` file as your workspace. This file contains all of the layers, animations and `S_SKIN` properties of your add-on. Sounds should be `*.ogg` files kept next to your `*.ase` file or in a subfolder like `sounds/*.ogg`. An example template is provided in `examples/example.ase`.

## Features
- [x] Full export for all sprites and sounds
- [x] Visual editor for `S_SKIN` properties
- [ ] Live preview for frames and palettes
- [ ] Raised wheel (Eggman) kart template
- [ ] Modded rivals support
- [ ] Multi-racer bundling
- [ ] SRB2K legacy export

## Support

Open an [issue](https://github.com/DragonDePlatino/Kart-Builder/issues) if you have any feature suggestion or bug report. Please include your `*.ase` file and a screenshot of any errors. Join the [Kart Krew](https://www.kartkrew.org/) Discord for any additional help using Kart Builder.
