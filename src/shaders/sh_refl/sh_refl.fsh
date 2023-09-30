varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//unis
uniform vec4 uvs;
uniform vec2 texel;

//sin
uniform float time;
//convert to unis later
uniform float slow;// = 100.0;
uniform float amount;// = 4.0;
uniform float waves;// = 20.0;

uniform float y_amount;// = 2.0;
uniform float y_waves;

uniform float blur;
uniform vec2 surf_size;
uniform float refl_alpha;

void main() {
	//Vars
	float _amount = amount * texel.x;
	float _y_amount = y_amount * texel.y;

	//Normalize
	vec2 Texcoord = v_vTexcoord;

	//y texcoord acc. to size
	Texcoord.y *= (surf_size.y / 96.0);

	//Wave x
	float wave_x = sin(time/slow + Texcoord.y * waves) * _amount * Texcoord.y;

	//Wave y
	float wave_y = sin(time/slow + Texcoord.y * y_waves) * _y_amount * Texcoord.y;

	//Apply
	vec2 finalCoord = v_vTexcoord + vec2(wave_x, wave_y);
	
	gl_FragColor = v_vColour * texture2D(gm_BaseTexture, finalCoord);
}