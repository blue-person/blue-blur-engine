if (!surface_exists(refl_org)) {
    refl_org = surface_create(sprite_width, sprite_height);
}
refl_surf_clear(refl_org);

if (!surface_exists(refl_surf)) {
    refl_surf = surface_create(sprite_width, sprite_height);
}
refl_surf_clear(refl_surf);

if (!surface_exists(refr_org)) {
    refr_org = surface_create(sprite_width, sprite_height);
}
refl_surf_clear(refr_org);

if (!surface_exists(flipSurf)) {
    flipSurf = surface_create(sprite_width, sprite_height);
}
refl_surf_clear(flipSurf);