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

void main() {
	//Vars
	float _amount = amount * texel.x;

	//Normalize
	vec2 Texcoord = v_vTexcoord;

	//reverse y texcoord
	Texcoord.y = abs(Texcoord.y - 1.0);

	//Wave x
	float wave_x = sin(time/slow + Texcoord.y * waves) * _amount;

	//Wave y
	float wave_y = sin(time/slow + Texcoord.y * waves) * _amount;

	//Apply
	vec2 finalCoord = v_vTexcoord + vec2(wave_x, wave_y);
	gl_FragColor = v_vColour * texture2D(gm_BaseTexture, finalCoord);

	//Discard if less alpha, out of bounds or land
	bool out_bound = (finalCoord.x < uvs.r) || (finalCoord.x > uvs.b) || (finalCoord.y < uvs.g) || (finalCoord.y > uvs.a);
}