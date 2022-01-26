# Godot FrameBuffer Object

## Usecases
* Conways Game of Life as a shader


![GameOfLife](https://user-images.githubusercontent.com/82725304/151081379-f8a105ab-a368-460a-bd99-fc4e79fc2ca9.png)
* Blur shader (blur input is the previous frame)


![GameOfLife](https://user-images.githubusercontent.com/82725304/151081630-cae03268-ece9-4558-af99-fedf9ad5b28a.png)

## Node Setup
![Nodestructure](https://user-images.githubusercontent.com/82725304/151080515-c89e50ee-0ce2-4faf-9f53-36b9126b9b23.PNG)

## How does it work?
The main shader runs on the sprite of ```Channel0```.
```Channel0_buf``` holds the previous frame of ```Channel0```.
This is done by using the viewport ```Channel0``` as the texture of 
```Channel0_buf```, and setting the ```Clear Mode``` to ```Next Frame``` and ```Update``` to ```Always```.

```Channel0_buf``` can be accessed by the sprite of ```Channel0``` by texture or an uniform.
In the shader of Channel0's sprite you can use the buffer, for example in a blur shader, where you blur the buffer result.

## Loop Setup
Some shaders require the texture to be changed more than once, for example in Conway's Game of Live.
To accomplish this, ```Channel0's sprite``` needs viewport ```Channel0_buf``` as the texture or a uniform,
and ```Channel0_buf's sprite``` needs viewport ```Channel0``` as the texture or a uniform.
A texture is introduced by setting it as the texture of ```Channel0's sprite```, and a ```script``` has to switch 
the texture at the ```second frame``` to the Viewport ```Channel0_buf```.

 
## Viewport Setup
* set the viewport size
* Rendering
  * Hdr -> unticked
  * Disable 3D -> ticked
  * Usage -> 2D
* Render Target
  * Clear Mode -> Next Frame
  * Update -> Always!


![ViewportSetup](https://user-images.githubusercontent.com/82725304/151080699-450d37b5-0202-4109-9779-138eb6163ff8.PNG)

  
## Sprite Setup
* Offset
  * Centered -> unticked
  * Flip V -> ticked (not for the output sprite)


![SpriteSetup](https://user-images.githubusercontent.com/82725304/151080934-fc185b5a-c748-409a-9b64-078b20b35835.PNG)
  
## Texture Sources (who uses which texture?)
* Channel0 Sprite: Input image
* Channel0_buf Sprite: Viewport Channel0
* Output: Channel0


