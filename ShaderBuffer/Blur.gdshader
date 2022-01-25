/*
	Game of Life Shader by Firerabbit
	
	MIT License
*/

shader_type canvas_item;


void fragment()
{
	vec2 offset = TEXTURE_PIXEL_SIZE * 0.75;
	float neighbours[4];
	neighbours[0] = texture(TEXTURE,UV + vec2(0, -offset.y)).r;
	neighbours[1] = texture(TEXTURE,UV + vec2(0, offset.y)).r;
	neighbours[2] = texture(TEXTURE,UV + vec2(-offset.x, 0)).r;
	neighbours[3] = texture(TEXTURE,UV + vec2(offset.x, 0)).r;
	
	float val = 0.0;
	
	for (int i = 0; i < 4; i++)
	{
		val += neighbours[i];
	}
	val /= 4.0;
	
	COLOR = vec4(vec3(val),1.);
}