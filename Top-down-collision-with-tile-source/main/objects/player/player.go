components {
  id: "player_script"
  component: "/Main/objects/player/player_script.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"player_standing\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/Main/objects/player/player.atlas\"\n"
  "}\n"
  ""
}
embedded_components {
  id: "shadow"
  type: "sprite"
  data: "default_animation: \"player_shadow\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "blend_mode: BLEND_MODE_MULT\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/Main/objects/player/player.atlas\"\n"
  "}\n"
  ""
  position {
    y: -232.0
    z: -0.01
  }
}
embedded_components {
  id: "state_label"
  type: "label"
  data: "size {\n"
  "  x: 128.0\n"
  "  y: 32.0\n"
  "}\n"
  "text: \"Standing\"\n"
  "font: \"/Main/assets/fonts/AmatiscSC-Regular.font\"\n"
  "material: \"/builtins/fonts/label.material\"\n"
  ""
  position {
    y: 328.0
  }
}
embedded_components {
  id: "collisionobject"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_KINEMATIC\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"player\"\n"
  "mask: \"obstacle\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_SPHERE\n"
  "    position {\n"
  "      y: -190.0\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 1\n"
  "  }\n"
  "  data: 47.67442\n"
  "}\n"
  ""
}
