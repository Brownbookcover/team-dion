shader_type spatial;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;
uniform sampler2D depth_texture : hint_depth_texture, filter_linear_mipmap;
uniform sampler2D normal_map : hint_normal;
uniform float distortion_strength : hint_range(0.0, 1.0);
uniform float distortion_scale;

void fragment() {
    // Sample screen texture and normal map
    vec2 uv = SCREEN_UV;
    vec3 normal = texture(normal_map, uv).rgb * 2.0 - 1.0; // Scale UV by scene depth

    // Apply distortion
    uv += distortion_strength * normal.xy;

    vec4 screen_color = texture(screen_texture, uv);

    // Output distorted color as emissive
    ALBEDO = screen_color.rgb;
    EMISSION = screen_color.rgb;
}
