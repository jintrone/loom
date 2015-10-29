package edu.msu.mi.loom

class SimulationTask {
    Tail tail
    int user_nbr
    int round_nbr

    static constraints = {
        user_nbr min: 0
        round_nbr min: 0
    }

    static mapping = {
        version false
    }

    static SimulationTask createForSimulation(Tail tail, int user_nbr = 0, int round_nbr = 0, boolean flush = true) {
        def instance = new SimulationTask(tail: tail, user_nbr: user_nbr, round_nbr: round_nbr)
        instance.save(flush: flush, insert: true)
        instance
    }
}