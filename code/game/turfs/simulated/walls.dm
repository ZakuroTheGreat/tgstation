#define MAX_DENT_DECALS 15

/turf/closed/wall/ratvar_act(force, ignore_mobs)
	. = ..()
	if(.)
		ChangeTurf(/turf/closed/wall/clockwork)

#undef MAX_DENT_DECALS
