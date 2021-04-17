shader_type canvas_item;

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	if (color.a > 0.0) {
		COLOR = vec4(1.0,1.0,1.0,1.0);
	} else {
		COLOR = color;
	}
}