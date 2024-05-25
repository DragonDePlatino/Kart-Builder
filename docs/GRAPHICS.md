The following graphics can be used as layer names in your Kart Builder template:

| Graphic | Fallback | Full Name              | Usage                                                                                                     |
|---------|----------|------------------------|-----------------------------------------------------------------------------------------------------------|
| `STIN`  |          | Still (Neutral)        | Idling.                                                                                                   |
| `STIL`  | `STIN`   | Still (Left)           | Steering left while idling. Most characters only define a unique frame for angle 5.                       |
| `STIR`  | `STIN`   | Still (Right)          | Steering right while idling. Most characters only define a unique frame for angle 5.                      |
| `STGL`  | `STIN`   | Still (Glance Left)    | Glancing left at 45 degrees while idling.                                                                 |
| `STGR`  | `STIN`   | Still (Glance Right)   | Glancing right at 45 degrees while idling.                                                                |
| `STLL`  | `STGL`   | Still (Look Left)      | Looking left at 90 degrees while idling.                                                                  |
| `STLR`  | `STGR`   | Still (Look Right)     | Looking right at 90 degrees while idling.                                                                 |
| `SLWN`  | `STIN`   | Slow (Neutral)         | Moving slowly.                                                                                            |
| `SLWL`  | `STIL`   | Slow (Left)            | Steering left while moving slowly. Most characters only define a unique frame for angle 5.                |
| `SLWR`  | `STIR`   | Slow (Right)           | Steering right while moving slowly. Most characters only define a unique frame for angle 5.               |
| `SLGL`  | `STGL`   | Slow (Glance Left)     | Glancing left at 45 degrees while moving slowly.                                                          |
| `SLGR`  | `STGR`   | Slow (Glance Right)    | Glancing right at 45 degrees while moving slowly.                                                         |
| `SLLL`  | `STLL`   | Slow (Look Left)       | Looking left at 90 degrees while moving slowly.                                                           |
| `SLLR`  | `STLR`   | Slow (Look Right)      | Looking right at 90 degrees while moving slowly.                                                          |
| `FSTN`  | `SLWN`   | Fast (Neutral)         | Moving quickly.                                                                                           |
| `FSTL`  | `SLWL`   | Fast (Left)            | Steering left while moving quickly. Most characters only define a unique frame for angle 5.               |
| `FSTR`  | `SLWR`   | Fast (Right)           | Steering right while moving quickly. Most characters only define a unique frame for angle 5.              |
| `FSGL`  | `SLGL`   | Fast (Glance Left)     | Glancing left at 45 degrees while moving quickly.                                                         |
| `FSGR`  | `SLGR`   | Fast (Glance Right)    | Glancing right at 45 degrees while moving quickly.                                                        |
| `FSLL`  | `SLLL`   | Fast (Look Left)       | Looking left at 90 degrees while moving quickly.                                                          |
| `FSLR`  | `SLLR`   | Fast (Look Right)      | Looking right at 90 degrees while moving quickly.                                                         |
| `DRLN`  | `FSGR`   | Drift (Left Neutral)   | Drifting left.                                                                                            |
| `DRLO`  | `DRLN`   | Drift (Left Outwards)  | Drifting left and steering away from the turn.                                                            |
| `DRLI`  | `DRLN`   | Drift (Left Inwards)   | Drifting left and steering into from the turn.                                                            |
| `DRRN`  | `FSGL`   | Drift (Right Neutral)  | Drifting right.                                                                                           |
| `DRRO`  | `DRRN`   | Drift (Right Outwards) | Drifting right and steering away from the turn.                                                           |
| `DRRI`  | `DRRN`   | Drift (Right Inwards)  | Drifting right and steering into from the turn.                                                           |
| `SPIN`  | `FSTN`   | Spinout                | Spinning out after taking damage. Most characters only define a unique head.                              |
| `DEAD`  |          | Dead                   | Knock-out animation when your kart has blown up and your racer is flying away.                            |
| `SIGN`  |          | Signpost               | Displayed at the end of races on the signpost when you win.                                               |
| `SIGL`  |          | Signpost (Hold This L) | A signpost replacement used by ironman characters when winning against players or hard bots.              |
| `SSIG`  |          | Shitty Signpost        | A badly-drawn signpost activated via the `working designs` password.                                      |
| `XTRA`  |          | Extra                  | Character portraits used in menus and the race minimap. See [EXPORT.md](EXPORT.md) for full explanations. |
| `TALK`  |          | Talk                   | Talking frames used in tutorial and Jack Frost dialog.                                                    |

The following fallbacks apply to the special `kart` layer only. If a layer group is named `kart`, these will be attempted before the above table:

| Graphic | Fallback |
| `SLWL`  | `SLWN`   |
| `SLWR`  | `SLWN`   |
| `SLGL`  | `SLWN`   |
| `SLGR`  | `SLWN`   |
| `SLLL`  | `SLWN`   |
| `SLLR`  | `SLWN`   |
| `FSTL`  | `SLWL`   |
| `FSTR`  | `SLWR`   |
| `FSLL`  | `FSTN`   |
| `FSLR`  | `FSTN`   |
