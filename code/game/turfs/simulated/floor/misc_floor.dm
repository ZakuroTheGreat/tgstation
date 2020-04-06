//Clockwork floor: Slowly heals toxin damage on nearby servants.
/turf/open/floor/clockwork
	name = "clockwork floor"
	desc = "Tightly-pressed brass tiles. They emit minute vibration."
	icon_state = "plating"
	baseturfs = /turf/open/floor/clockwork
	footstep = FOOTSTEP_PLATING
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	var/dropped_brass
	var/uses_overlay = TRUE
	var/obj/effect/clockwork/overlay/floor/realappearence

/turf/open/floor/clockwork/Bless() //Who needs holy blessings when you have DADDY RATVAR?
	return

/turf/open/floor/clockwork/Initialize()
	. = ..()
	if(uses_overlay)
		new /obj/effect/temp_visual/ratvar/floor(src)
		new /obj/effect/temp_visual/ratvar/beam(src)
		realappearence = new /obj/effect/clockwork/overlay/floor(src)
		realappearence.linked = src

/turf/open/floor/clockwork/Destroy()
	STOP_PROCESSING(SSobj, src)
	if(uses_overlay && realappearence)
		QDEL_NULL(realappearence)
	return ..()

/turf/open/floor/clockwork/ReplaceWithLattice()
	. = ..()
	for(var/obj/structure/lattice/L in src)
		L.ratvar_act()

/turf/open/floor/clockwork/Entered(atom/movable/AM)
	..()
	START_PROCESSING(SSobj, src)

/turf/open/floor/clockwork/process()
	if(!healservants())
		STOP_PROCESSING(SSobj, src)

/turf/open/floor/clockwork/proc/healservants()
	for(var/mob/living/L in src)
		if(L.stat == DEAD)
			continue
		. = 1
		if(!is_servant_of_ratvar(L) || !L.toxloss)
			continue

		var/image/I = new('icons/effects/effects.dmi', src, "heal", ABOVE_MOB_LAYER) //fake a healing glow for servants
		I.appearance_flags = RESET_COLOR
		I.color = "#5A6068"
		I.pixel_x = rand(-12, 12)
		I.pixel_y = rand(-9, 0)
		var/list/viewing = list()
		for(var/mob/M in viewers(src))
			if(M.client && (is_servant_of_ratvar(M) || isobserver(M) || M.stat == DEAD))
				viewing += M.client
		flick_overlay(I, viewing, 8)
		L.adjustToxLoss(-3, TRUE, TRUE)

/turf/open/floor/clockwork/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/clockwork/crowbar_act(mob/living/user, obj/item/I)
	if(islist(baseturfs))
		if(type in baseturfs)
			return TRUE
	else if(baseturfs == type)
		return TRUE
	user.visible_message("<span class='notice'>[user] begins slowly prying up [src]...</span>", "<span class='notice'>You begin painstakingly prying up [src]...</span>")
	if(I.use_tool(src, user, 70, volume=80))
		user.visible_message("<span class='notice'>[user] pries up [src]!</span>", "<span class='notice'>You pry up [src]!</span>")
		make_plating()
	return TRUE

/turf/open/floor/clockwork/make_plating()
	if(!dropped_brass)
		new /obj/item/stack/tile/brass(src)
		dropped_brass = TRUE
	if(islist(baseturfs))
		if(type in baseturfs)
			return
	else if(baseturfs == type)
		return
	return ..()

/turf/open/floor/clockwork/narsie_act()
	..()
	if(istype(src, /turf/open/floor/clockwork)) //if we haven't changed type
		var/previouscolor = color
		color = "#960000"
		animate(src, color = previouscolor, time = 8)
		addtimer(CALLBACK(src, /atom/proc/update_atom_colour), 8)

/turf/open/floor/clockwork/reebe
	name = "cogplate"
	desc = "Warm brass plating. You can feel it gently vibrating, as if machinery is on the other side."
	icon_state = "reebe"
	floor_tile = /turf/open/floor/clockwork/reebe
	uses_overlay = FALSE
	planetary_atmos = TRUE
