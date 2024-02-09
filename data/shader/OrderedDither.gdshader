shader_type canvas_item;
render_mode blend_mix;

uniform vec4 ColorLight : source_color = vec4(0.780392, 0.941176, 0.847059, 1.000000);
uniform vec4 ColorDark : source_color = vec4(0.262745, 0.321569, 0.239216, 1.000000);
uniform vec3 ScreenSize = vec3(84.000000, 48.000000, 0.000000);
uniform sampler2D dither_texture: filter_nearest;

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	float luminosity = max(max(color.r, color.g), color.b);
	//float luminosity = (color.r * 0.299) + (color.g * 0.587) + (color.b * 0.114);

	float x = fract(UV.x * ScreenSize.x / 4.0);
	float y = fract(UV.y * ScreenSize.y / 4.0);

	vec2 dither_sample_coords = vec2(x,y);
	vec4 dither_color = texture(dither_texture, dither_sample_coords);
		
	//COLOR.rgb = luminosity > 0.0 ? ColorLight.rgb : ColorDark.rgb;//
	COLOR.rgb = (luminosity > dither_color.r * 0.9375) ? ColorLight.rgb : ColorDark.rgb;
}
