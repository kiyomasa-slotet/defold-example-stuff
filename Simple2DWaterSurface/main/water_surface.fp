varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;

uniform sampler2D iChannel0;
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;

uniform lowp vec4 iTime;
uniform lowp vec4 speed;
uniform lowp vec4 scale;

float avg(vec4 color) {
	return (color.r + color.g + color.b)/3.0;
}

void main()
{
	float opacity = 0.0001;

	vec2 uv = var_texcoord0;
	vec2 scaledUv = uv*scale.x;

	vec4 water1 = texture2D(iChannel0, scaledUv + iTime.x*-0.02*speed.x - 0.1);
	vec4 water2 = texture2D(iChannel0, scaledUv.xy + iTime.x*speed.x*vec2(-0.02, -0.02) + 0.1);

	vec4 highlights1 = texture2D(iChannel2, scaledUv.xy + iTime.x*speed.x / vec2(-10, 100));
	vec4 highlights2 = texture2D(iChannel2, scaledUv.xy + iTime.x*speed.x / vec2(10, 100));

	vec4 background = texture2D(iChannel1, vec2(uv) + avg(water1) * 0.05);

		water1.rgb = vec3(avg(water1));
		water2.rgb = vec3(avg(water2));

		highlights1.rgb = vec3(avg(highlights1)/1.5);
		highlights2.rgb = vec3(avg(highlights2)/1.5);

		float alpha = opacity;

		if(avg(water1 + water2) > 0.3) {
			alpha = 0.0;
		}

		if(avg(water1 + water2 + highlights1 + highlights2) > 0.75) {
			alpha = 5.0 * opacity;
		}

		gl_FragColor = vec4((water1 + water2) * alpha + background);
}