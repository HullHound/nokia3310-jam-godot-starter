# nokia3310-jam-godot-starter
A Godot starter project for the nokia3310 game jam

Use this project to get a kick start for the Nokia 3310 Jam on itch.io!
[Link to the Jam](https://itch.io/jam/nokiajam6)


Everything inside the Game.tscn scene will be rendered with two colors from the official palette with an option to apply an ordered dithering shader.

This can be enabled by setting the shader property in the material of Main.tscn/SubViewportContainer

## Recommendations for best results
1. Load images in LossLess or VRAM Uncompressed Modes
2. If using 2D, only use whole pixels (not fractional pixels (ie. Having something positioned at 1.5, 1.5))

![Example screen](/example.png)
