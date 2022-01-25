/*
	Game of Life Shader by Firerabbit
	
	MIT License
*/

shader_type canvas_item;


void fragment()
{
	vec2 offset = TEXTURE_PIXEL_SIZE;
	int middle = texture(TEXTURE,UV).r > 0.5 ? 1 : 0;
	int sum = 0;
	float val = 0.0;
	
	// sum of neighbour pixels
	for (int y = -1; y<= 1; y++)
	{
		for (int x = -1; x <= 1; x++){
			// mask pixel in the middle
			if (!(y == 0 && x == 0))
			{
				sum += texture(TEXTURE,UV + vec2(float(x), float(y)) * offset).r > 0.5 ? 1 : 0;
			}
		}
	}
	
	// Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
	if (sum == 3 && middle == 0) 
	{
		val = 1.0;
	} 
	// Any live cell with fewer than two live neighbours dies, as if by underpopulation.
	else if (middle == 1 && sum < 2)
	{
		val = 0.0;
	} 
	// Any live cell with two or three live neighbours lives on to the next generation.
	else if (middle == 1 && sum < 4)
	{
		val = 1.0;
	} 
	// Any live cell with more than three live neighbours dies, as if by overpopulation.
	else if (middle == 1 && sum > 3)
	{
		val = 0.0;
	}

	COLOR = vec4(vec3(val),1.);
}