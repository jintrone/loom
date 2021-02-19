package edu.msu.mi.loom

class TrainingSet {


    static hasMany = [simulations: Simulation, trainings: Training, HITId: String]

    String name
    List<Training> trainings
    String qualifier
    int HIT_num
    float training_payment
    List<String> HITId = new ArrayList<>()

    static constraints = {
        name blank: false, unique: true
        simulations nullable: true
        trainings nullable: true
        qualifier nullable: true
    }


    static String constructQualificationString(TrainingSet ts) {
        "LoomTraining${ts.id}"
    }
}