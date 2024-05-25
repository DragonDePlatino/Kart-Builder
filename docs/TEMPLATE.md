# Template

Kart Builder uses a special layer layout to organize your racer's frames and rotations. You can copy the provided `example/example.ase` for a pre-configured template.

## Layer Groups

Aseprite [layer groups](https://www.aseprite.org/docs/layer-group/) contain the layers of your racer, from top to bottom. The provided template comes with a `head`, `body` and `kart` layer group. You can have as many or few layer groups as you want. The `kart` layer group follows special rules for outputting frames outlined in [Graphics](GRAPHICS.md).

### Layers

The [layers](https://www.aseprite.org/docs/layers/) under each group correspond to the graphics of your racer. On export, Kart builder will merge the layers from bottom-to-top in the final graphic. Example: when outputting the `STIN` frames, Kart Builder will stack `kart > STIN`, `body > STIN` then `head > STIN` in that order. You are not limited to the layers provided in the template. Consult [Graphics](GRAPHICS.md) for a full list of usable layer names.

### Frames

The [frames](https://www.aseprite.org/docs/cel/) in each layer correspond to the different angles for each graphic. Frames 1-8 correspond to angles 1-8 of the Doom graphic. If frames 6-8 are missing for all layers, that graphic will be treated as symmetrical. See [ZDoom Wiki: Sprite](https://zdoom.org/wiki/Sprite) for a full explanation.

Frames 9-16 and onward define different animation frames for each graphic. 9-16 define all the angles for animation frame 2, 17-24 correspond to animation frame 3, etc. These are typically only used for the wheel flashing animation, but you may define custom heads and bodies as well.

### Slices

Aseprite [slices](https://www.aseprite.org/docs/slices/) are used to define the size and offset of your kart. You typically don't need to edit this unless you have resized your canvas.

### Fallbacks

If a layer is missing for a graphic, Kart Builder will try to find a fallback layer to render instead. For example, if you were missing frame `DRLN` for layer group `head`, then Kart Builder will try to resolve `DRLN > FSGR > SLGR > STGR > STIN` in that order. See [Graphics](GRAPHICS.md) for a full list of these fallbacks.

If Kart Builder cannot find any fallbacks in the chain, it will skip outputting that layer group. This is common for the `XTRA`, `DEAD`, `SIGN` and `SIGN` layers. In the example template, these are only rendered in the `body` layer group and the rest of the layer groups are transparent. It is suggested you only define these in the `body` layer group.

## Tips

* Go to `Edit > Keyboard Shortcuts > Menus` and define a shortcut for `File > Export > Export Kart` for faster exporting. `Ctrl+Shift+E` is suggested.
* The canvas can be resized for larger or smaller sprites. Make sure to update your slice's pivot point if you do so!
* You can define more complicated animations than base game characters by specifying frames 9-16 for the `head` and `body` layers. An example would be a character with flowing hair or a different expression when moving quickly in `FSTN`.
* To make simple joke characters with no animations, you can delete every layer except `body > STIN` and just define those 5 frames.
* Kart Builder does not currently support some features like modded rivals or extra-large `DEADA0` frames (like Eggman). You can always edit the output `*.pk3` file in [SLADE](https://slade.mancubus.net/index.php?page=downloads) to make additional edits.
  * **WARNING**: Kart Builder will clear the contents of the `*.pk3` on every export. Any manual edits you made will be reverted on next export!
