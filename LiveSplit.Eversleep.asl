state("Eversleep Lunistice Gaiden") {
    float runTimer: "UnityPlayer.dll", 0x01A0E220, 0x128, 0x80, 0x154;
    bool timerPaused: "UnityPlayer.dll", 0x01A0E220, 0x128, 0x80, 0x171;
    bool runActive: "UnityPlayer.dll", 0x01A0E220, 0x128, 0x80, 0x172;
}

start {
    return current.runActive && !old.runActive;
}

split {
    return current.timerPaused && !old.timerPaused;
}

gameTime {
    return TimeSpan.FromSeconds(current.runTimer);
}

reset {
    return !current.runActive && old.runActive;
}

isLoading {
    return true;
}
