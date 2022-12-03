function st_v1draw() {
	
	
	//MAKE HIM TURN WHILE IN AIR
	
	
	c_drawinput();
	weapons[eqwp][altpos].draw();
	st_drawui();
	ang = point_mouse();
	image_xscale = -ineg(ang >= 90 && ang <= 270);
	var j, dude;
	iterate weapons to {
		j=0
	
		
		ang = mod_negative(point_mouse()-180+(i-(array_length(weapons)-1)/2)*20, 360);
		dude = distabs_ext(ang, 6, 1, 1.5);
		draw_sprite_ext(
			s_v1wings, 0,
			df.x+dude.x, df.y+dude.y, 1,
			ineg(ang >= 90 && ang <= 270), ang, c_white, 1
		);
		if i == eqwp /*&& j == altpos*/ {
			draw_sprite_ext(
				s_v1wings, 1,
				df.x+dude.x, df.y+dude.y, 1,
				ineg(ang >= 90 && ang <= 270), ang, c_grey, 1
			);
			ang = point_mouse();
			dude = distabs_ext(ang, 9, 1, 1);
			draw_sprite_ext(
				weapons[i][altpos].sprite, 0,
				df.x-2*image_xscale+dude.x, df.y-3+dude.y, 1,
				ineg(ang >= 90 && ang <= 270), ang, c_white, 1
			);
			
		} else {
			
			/*dude = distabs_ext(ang+10, 11+sinmult(gc, 60, 2), 1, 1.5);
			draw_sprite_ext(
				weapons[i][0].sprite, 0,
				df.x-2*image_xscale+dude.x, df.y-3+dude.y, 1,
				ineg(ang >= 90 && ang <= 270), ang, c_grey, .4
			);*/
			
			
			draw_sprite_ext(
				s_v1wings, 0,
				df.x+dude.x, df.y+dude.y, 1,
				ineg(ang >= 90 && ang <= 270), ang, c_white, 1
			);
			gpu_set_blendmode(bm_add);
			draw_sprite_ext(
				s_v1wings, 1,
				df.x+dude.x, df.y+dude.y, 1,
				ineg(ang >= 90 && ang <= 270), ang, c_white, 1
			);
			gpu_set_blendmode(bm_normal);
		}
		
	
		for (j=0; j<array_length(weapons[i]); j++) {
			weapons[i][j].x = df.x-2*image_xscale+dude.x;
			weapons[i][j].y = df.y-3+dude.y;
		}
	}
	var ang = point_mouse();
	var theflip = ineg(ang >= 90 && ang <= 270);
	draw_sprite_ext(s_v1gunarm, 2, x-2*image_xscale, y-4, theflip, image_yscale, point_mouse()+90, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
	draw_sprite_ext(s_v1lights, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
	faceangle = lerp_angle(faceangle, ang, .15);
	draw_sprite_ext(s_v1face, 0, x, y-8, 1, ineg(ang >= 90 && ang <= 270), faceangle, c_white, 1);
	draw_sprite_ext(s_v1face, 1, x, y-8, 1, ineg(ang >= 90 && ang <= 270), faceangle, c_white, 1);
	if !punchdelay {
		draw_sprite_ext(s_v1arm, 0, x+2*image_xscale, y-4, -image_xscale, image_yscale, -spd.h*11, c_white, 1);
	} else {
		if punchdelay > 30 {
			draw_sprite_ext(s_v1arm, 1, x+2*image_xscale, y-3, 1*((punchdelay-30)/5+1), theflip*((punchdelay-30)/5+1), ang, c_white, 1);
		} else {
			draw_sprite_ext(s_v1arm, 2, x+2*image_xscale, y-3, -1, theflip, ang, c_white, 1);
		}
	}
}