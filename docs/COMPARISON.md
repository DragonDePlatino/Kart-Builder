
Kart Maker and Kart Builder are the two tools currently available to develop racers for Dr. Robotnik's Ring Racers. If you are unsure about the tool for you, here is a rundown of the advantages of each.

# Kart Maker
## Advantages
* **Simple to use** - Anyone who can edit static PNG files can pick up and start using it!
* **Unopinionated tooling** - Any image editor can be used with Kart Maker, even ones that lack transparency support like Windows XP MS Paint. You do not need to purchase or compile an art program to use Kart Maker.
* **Easily available** - Kart Maker is bundled with Dr. Robotnik's Ring Racers.

## Disadvantages
* **No palette preview** - Sprites can only be edited within the default green palette, you must boot up the game to preview different palettes. Kart Maker performs a color conversion step so what is seen in the template may look different in-game.
* **No animated preview** - Template images are not animated, you cannot preview or onion-skin your animations to check for inconsistencies between frames.
* **Template redundancy** - Many parts of a racer stay the same between animations, eg. the body. If you want to make changes to these parts, you will need to copy and paste your edits across each frame.
* **Complicated templating** - Different templates are needed for symmetric, asymmetric, normal-sized and large racers. If you need to alter your template, you must manually edit your `properties.txt` and type new pixel values into it.
* **Unclear template layout** - Templates require labels and external documentation to understand their layout, they are not self-documenting.
* **Missing features** - Kart Maker does not initially support some features like character flags or `SSIG` sprites. You will need to edit the Kart Maker template or manually edit your `S_SKIN` in SLADE to add these.
* **Uncompressed output** - Kart Maker outputs uncompressed WAD files, which take longer to download from servers.

# Kart Builder
## Advantages
* **Live palette preview** - Templates use indexed color, so they look exactly how in-game colors look. You can quickly cycle through the game's palettes by selecting a drop-down option.
* **Animated preview** - Templates utilize animated image files, so you can preview your sprite for any animation inconsistencies without exporting and booting up the game.
* **Non-redundant templates** - Kart Builder reuses parts of your sprite that do not change between animations, like the body. Updating these parts will automatically update all of the exported aniamtions.
* **Simple templating** - You can make a bigger racer by resizing your canvas and add different animations by simply adding new named layers to your template. You do not need to manually edit any text files.
* **Self-documenting templates** - Templates are self-explanatory: the layer names match what the output sprites will be. Kart Builder uses the same sprite terminology the game files use.
* **Fully featured** - Every animation and property is supported in Kart Builder by default. Manual edits are only needed for some features like modded palettes or rivals.
* **Compressed output** - Kart Builder outputs compressed `*.pk3` files for faster downloading from servers.

## Disadvantages
* **Initial learning curve** - You must understand Kart Builder's layer layout and the game's sprite names before you can start using it. Thorough documentation is available for all of this.
* **Opinionated tooling** - Kart Builder requires Aseprite to run. You will need to purchase or compile a copy of Aseprite to run it. 7-Zip must also be installed.
* **Less available** - Kart Builder updates must be downloaded from the SRB2 Add-On Database or GitHub. It is not packaged with Dr. Robotnik's Ring Racers.
