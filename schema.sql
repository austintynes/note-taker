DROP DATABASE IF EXISTS fighters_db;
CREATE DATABASE fighters_db;
USE fighters_db;
/*fighters table*/
CREATE TABLE fighters (
    /*basic info*/
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sex VARCHAR(1) NOT NULL,
    /*M or F*/
    age VARCHAR(2) NOT NULL,
    /* high of 60*/
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    nickname VARCHAR(30) NOT NULL,
    height_inches INT NOT NULL,
    reach_inches INT NOT NULL,
    weight_lbs INT NOT NULL,
    weight_class VARCHAR(17) NOT NULL,
    /*light heavyweight*/
    /*speed and agility*/
    reaction_time INT NOT NULL,
    /*.3 > .05*/
    agility INT NOT NULL,
    run_speed INT NOT NULL,
    punch_speed INT NOT NULL,
    kick_speed INT NOT NULL,
    /*strength and power*/
    absolute_strength INT NOT NULL,
    relative_strength INT NOT NULL,
    explosive_strength INT NOT NULL,
    explosive_capacity,
    punch_power INT GENERATED ALWAYS AS (((weight_lb * 0.453592) * (boxing_offense / 1000))) * ((punch_speed * punch_speed) * 0.44704) /(1 -(boxing_off / 1000) * 5) /(absolute_strength *.00012) STORED,
    kick_power INT GENERATED ALWAYS AS INT GENERATED ALWAYS AS (
        (
            (weight_lb * 0.453592) * (kickboxing_offense / 1000)
        )
    ) * ((kick_speed * kick_speed) * 0.44704) /(1 -(kickboxing_off / 1000) * 5) /(absolute_strength *.00012) STORED,
    /*durability*/
    chin_durability INT NOT NULL,
    body_durability INT NOT NULL,
    leg_durability INT NOT NULL,
    /*intangibles*/
    max_cardio INT NOT NULL,
    metabolism INT NOT NULL,
    diet_discipline INT NOT NULL,
    body_type VARCHAR(9) NOT NULL,
    /*ectomorph, mesomorph, endomorph*/
    work_ethic INT NOT NULL,
    /*stance direction*/
    stance VARCHAR(8) NOT NULL,
    /*orthodox, southpaw, switch*/
    /*orthodox boxing offense*/
    orth_jab INT NOT NULL,
    orth_cross INT NOT NULL,
    orth_lefthook INT NOT NULL,
    orth_righthook INT NOT NULL,
    orth_overhand INT NOT NULL,
    orth_leadUppercut INT NOT NULL,
    orth_rearUppercut INT NOT NULL,
    orth_boxing_offense INT GENERATED ALWAYS AS (
        orth_jab + orth_cross + orth_lefthook + orth_righthook + orth_overhand + orth_leadUppercut + orth_rearUppercut
    ) / 7 STORED,
    /*southpaw boxing offense*/
    south_jab INT NOT NULL,
    south_cross INT NOT NULL,
    south_righthook INT NOT NULL,
    south_lefthook INT NOT NULL,
    south_overhand INT NOT NULL,
    south_leadUppercut INT NOT NULL,
    south_rearUppercut INT NOT NULL,
    south_boxing_offense INT GENERATED ALWAYS AS (
        south_jab + south_cross + south_lefthook + south_righthook + south_overhand + south_leadUppercut + south_rearUppercut
    ) / 7 STORED,
    /*defensive guard type*/
    defensive_guard VARCHAR(12),
    /*conventional, high guard, phillyshell, long guard, peekaboo, cross guard, low guard, karate*/
    /*boxing defense*/
    orth_boxing_guard_strength INT NOT NULL,
    orth_boxing_head_movement INT NOT NULL,
    south_boxing_guard_strength INT NOT NULL,
    south_boxing_head_movement INT NOT NULL,
    orth_boxing_defense INT GENERATED ALWAYS AS (
        orth_boxing_guard_strength + orth_boxing_head_movement
    ) / 2 STORED,
    south_boxing_defense INT GENERATED ALWAYS AS (
        south_boxing_guard_strength + south_boxing_head_movement
    ) / 2 STORED,
    boxing_defense INT GENERATED ALWAYS AS (orth_boxing_defense + south_boxing_defense) / 2 STORED,
    /*kickboxing offense*/
    orth_head_kick INT NOT NULL,
    orth_body_kick INT NOT NULL,
    orth_leg_kick INT NOT NULL,
    south_head_kick INT NOT NULL,
    south_body_kick INT NOT NULL,
    south_leg_kick INT NOT NULL,
    orth_kickboxing_offense INT GENERATED ALWAYS AS (orth_head_kick + orth_body_kick + orth_leg_kick) / 3,
    south_kickboxing_offense INT GENERATED ALWAYS AS (
        south_head_kick + south_body_kick + south_leg_kick
    ) / 3,
    kickboxing_offense INT GENERATED ALWAYS AS (
        orth_kickboxing_offense + south_kickboxing_offense
    ) / 2,
    /*kickboxing defense*/
    orth_head_kick_defense INT NOT NULL,
    orth_body_kick_defense INT NOT NULL,
    orth_leg_kick_defense INT NOT NULL,
    south_head_kick_defense INT NOT NULL,
    south_body_kick_defense INT NOT NULL,
    south_leg_kick_defense INT NOT NULL,
    orth_kickboxing_defense INT GENERATED ALWAYS AS (
        orth_head_kick_defense + orth_body_kick_defense + orth_leg_kick_defense
    ) / 3,
    south_kickboxing_defense INT GENERATED ALWAYS AS (
        south_head_kick_defense + south_body_kick_defense + south_leg_kick_defense
    ) / 3,
    kickboxing_defense INT GENERATED ALWAYS AS (
        orth_kickboxing_defense + south_kickboxing_defense
    ) / 2,
    /*muay thai offense*/
    elbows_offense INT NOT NULL,
    knees_offense INT NOT NULL,
    muay_thai_offense INT GENERATED ALWAYS AS (elbows_offense + knees_offense) / 2,
    /*muay thai defense*/
    elbows_defense INT NOT NULL,
    knees_defense INT NOT NULL,
    muay_thai_defense INT GENERATED ALWAYS AS (elbows_defense + knees_defense) / 2,
    /*takedown offense*/
    initial_shot INT NOT NULL,
    chain_wrestling INT NOT NULL,
    takedown_offense INT GENERATED ALWAYS AS (initial_shot + chain_wrestling) / 2,
    /*takedown defense*/
    initial_sprawl INT NOT NULL,
    chain_wrestling_defense INT NOT NULL,
    takedown_defense INT GENERATED ALWAYS AS (initial_sprawl + chain_wrestling_defense) / 2,
    /*ground control offense*/
    ground_control INT NOT NULL,
    /*ground control defense*/
    ground_control_defense INT NOT NULL,
    /*submission offense*/
    submission_offense INT NOT NULL,
    /*submission defense*/
    submission_defense INT NOT NULL
);