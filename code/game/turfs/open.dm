/turf/open/indestructible/clock_spawn_room
	name = "cogmetal floor"
	desc = "Brass plating that gently radiates heat. For some reason, it reminds you of blood."
	icon_state = "reebe"
	baseturfs = /turf/open/indestructible/clock_spawn_room
	footstep = FOOTSTEP_PLATING
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/clock_spawn_room/Entered()
	..()
	START_PROCESSING(SSfastprocess, src)

/turf/open/indestructible/clock_spawn_room/Destroy()
	STOP_PROCESSING(SSfastprocess, src)
	. = ..()

/turf/open/indestructible/clock_spawn_room/process()
	if(!port_servants())
		STOP_PROCESSING(SSfastprocess, src)

/turf/open/indestructible/clock_spawn_room/proc/port_servants()
	. = FALSE
	for(var/mob/living/L in src)
		if(is_servant_of_ratvar(L) && L.stat != DEAD)
			. = TRUE
			L.forceMove(get_turf(pick(GLOB.servant_spawns)))
			visible_message("<span class='warning'>[L] vanishes in a flash of red!</span>")
			L.visible_message("<span class='warning'>[L] appears in a flash of red!</span>", \
			"<span class='bold cult'>sas'so c'arta forbici</span><br><span class='danger'>You're yanked away from [src]!</span>")
			playsound(src, 'sound/magic/enter_blood.ogg', 50, TRUE)
			playsound(L, 'sound/magic/exit_blood.ogg', 50, TRUE)
			flash_color(L, flash_color = "#C80000", flash_time = 10)