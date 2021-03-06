package edu.msu.mi.loom

import edu.msu.mi.loom.utils.ConstraintUnitSpec
import grails.buildtestdata.mixin.Build
import grails.test.mixin.TestFor
import spock.lang.Unroll

@TestFor(Simulation)
@Build(Simulation)
class SimulationSpec extends ConstraintUnitSpec {

    def setup() {
        mockForConstraintsTests(Simulation, [Simulation.build(name: "First experiment")])
    }

    @Unroll("test Simulation all constraints #field is #error")
    void "test Simulation all constraints"() {
        when:
        def simulation = new Simulation("$field": val)

        then:
        validateConstraints(simulation, field, error)

        where:
        error      | field        | val
        'nullable' | 'name'       | getEmptyString()
        'nullable' | 'name'       | null
        'min'      | 'roundCount' | 0
        'min'      | 'roundTime'  | 0
    }
}
