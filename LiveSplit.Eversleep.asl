state("Eversleep Lunistice Gaiden") {
    float timer: "UnityPlayer.dll", 0x0199AD80, 0x18, 0x3A8, 0x1C4;
}

start {
    if (current.timer > 0 && old.timer == 0) {
        vars.timer = 0;
        vars.counter = 0;
        vars.timeToSet = 0;
        return true;
    }
}

split {
    if (current.timer == 0) {
        if (current.timer < old.timer) {
            vars.counter = 1;
            vars.timeToSet = old.timer;
        } else if (vars.counter > 0) {
            if (vars.counter == 2) {
                vars.timer += vars.timeToSet;
                vars.timeToSet = 0;
                vars.counter = 0;
                return true;
            } else {
                vars.counter += 1;
            }
        }
    } else {
        vars.timeToSet = 0;
        vars.counter = 0;
    }
}

gameTime {
    return TimeSpan.FromSeconds(vars.timer + vars.timeToSet + current.timer);
}

isLoading {
    return true;
}
