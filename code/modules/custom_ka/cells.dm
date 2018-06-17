/obj/item/custom_ka_upgrade/cells/attack_self(mob/user as mob)

	if(is_pumping)
		return

	if(pump_restore)
		is_pumping = TRUE
		if(stored_charge >= cell_increase)
			to_chat(user,"The pump on the [src] refuses to move.")
		else
			if(!pump_delay || do_after(user,pump_delay,use_user_turf = -1))
				if(isturf(src.loc))
					to_chat(user,"You pump \the [src].")
				else
					to_chat(user,"You pump \the [src.loc].")
				stored_charge = min(stored_charge + pump_restore,cell_increase)
				playsound(src,'sound/weapons/kenetic_reload.ogg', 50, 0)

		is_pumping = FALSE
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

/obj/item/custom_ka_upgrade/cells/cell01
	//Pump Action
	name = "pump action KA cell"
	build_name = "pump-action"
	desc = "A very basic power cell and pump action combo that stores a single charge. A pump is required after each shot, however it deals increased damage and has increased range."
	icon_state = "cell01"
	damage_increase = 5
	firedelay_increase = 0.25 SECONDS
	range_increase = 3
	recoil_increase = -1
	cost_increase = -100 //Always have a single charge
	cell_increase = 1
	capacity_increase = -1
	mod_limit_increase = 0

	pump_restore = 1
	pump_delay = 0.4 SECONDS

	origin_tech = list(TECH_MATERIAL = 2,TECH_ENGINEERING = 2,TECH_MAGNET = 2,TECH_POWER = 2)

/obj/item/custom_ka_upgrade/cells/cell02
	//Pump Action
	name = "pump recharging KA cell"
	build_name = "pump-recharging"
	desc = "A somewhat more advanced, standard issue pump and cell assembly that allows the user to 'pre-pump' their charges, up to a capacity of 12. Can fire quite quickly."
	icon_state = "cell02"
	firedelay_increase = 0
	recoil_increase = 1
	cell_increase = 12
	capacity_increase = -2
	mod_limit_increase = 0

	pump_restore = 1
	pump_delay = 0.5 SECONDS

	origin_tech = list(TECH_MATERIAL = 3,TECH_ENGINEERING = 3,TECH_MAGNET = 3,TECH_POWER = 3)

/obj/item/custom_ka_upgrade/cells/cell03
	name = "kinetic charging KA cell"
	build_name = "kinetic-reloading"
	desc = "A complex pump and cell assembly that uses the kinetic energy of an initial pump to significantly charge the cell. Deals increased damage at the cost of severely increased recoil and reduced firerate."
	icon_state = "cell03"
	damage_increase = 10
	firedelay_increase = 0.5 SECONDS
	recoil_increase = 4
	cost_increase = -1
	cell_increase = 40
	capacity_increase = -3
	mod_limit_increase = 0

	pump_restore = 40
	pump_delay = 1 SECONDS

	origin_tech = list(TECH_MATERIAL = 4,TECH_ENGINEERING = 4,TECH_MAGNET = 4,TECH_POWER = 4)

/obj/item/custom_ka_upgrade/cells/cell04
	name = "uranium charging KA cell"
	build_name = "recharging"
	desc = "A pumpless cell assembly that containes a miniaturized nuclear reactor housed safely inside the assembly. Recharges the cell shortly over time, however deals slightly reduced damage."
	icon_state = "cell04"
	damage_increase = -5
	recoil_increase = 0
	cost_increase = -2
	cell_increase = 60
	capacity_increase = -4
	mod_limit_increase = 0

	pump_restore = 0
	pump_delay = 0

	origin_tech = list(TECH_MATERIAL = 5,TECH_ENGINEERING = 5,TECH_MAGNET = 5,TECH_POWER = 5)

/obj/item/custom_ka_upgrade/cells/cell04/on_update(var/obj/item/weapon/gun/custom_ka/the_gun)
	stored_charge = min(stored_charge + 4,cell_increase)

/obj/item/custom_ka_upgrade/cells/cell05
	name = "recoil reloader KA cell"
	build_name = "recoil-reloading"
	desc = "A very experimental and well designed cell and pump assembly that converts some of the kinetic energy from the weapon's recoil into usable energy. Only works if the recoil is high enough. Contains a basic top-mounted pump just in case."
	icon_state = "cell05"
	firedelay_increase = 0.4 SECONDS
	damage_increase = 0
	recoil_increase = -5
	cost_increase = -3
	cell_increase = 80
	capacity_increase = -5
	mod_limit_increase = 0

	pump_restore = 5
	pump_delay = 0.5 SECONDS

	origin_tech = list(TECH_MATERIAL = 6,TECH_ENGINEERING = 6,TECH_MAGNET = 6,TECH_POWER = 6)

/obj/item/custom_ka_upgrade/cells/cell05/on_fire(var/obj/item/weapon/gun/custom_ka/the_gun)
	if(the_gun.recoil_increase > 0)
		stored_charge = min(stored_charge + min(the_gun.recoil_increase*2,the_gun.cost_increase*0.5),cell_increase)

/obj/item/custom_ka_upgrade/cells/illegal
	//Pump Action
	name = "pump action KA cell"
	build_name = "static"
	desc = "A clusterfuck of circuitry and battery parts all snuggly fit inside a solid, static plastisteel frame."
	icon_state = "cell_illegal"
	firedelay_increase = 0
	recoil_increase = 0
	cost_increase = 0
	stored_charge = 20
	cell_increase = 20
	capacity_increase = 0
	mod_limit_increase = 0

	pump_restore = 20
	pump_delay = 0.5 SECONDS

	origin_tech = list(TECH_MATERIAL = 3,TECH_ENGINEERING = 3,TECH_MAGNET = 3,TECH_POWER = 3, TECH_ILLEGAL = 4)