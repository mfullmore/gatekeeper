/**
 * @description Here are some tests
 * @group Testing
 * @since 2020
 * @author mike.542@gmail.com
 */

@isTest
private class GATE__GatekeeperTests {

    @isTest
    static void testNullName() {
        System.assertEquals(
            false,
            GATE__Gatekeeper.check(null),
            'Failure null check'
        );

        System.assertEquals(
            false,
            GATE__Gatekeeper.check(''),
            'Failure empty string check'
        );
    }

    @isTest
    static void testNotThere() {
        System.assertEquals(
            false,
            GATE__Gatekeeper.check('never_call_your_feature_this_test'),
            'Failure name not there test'
        );
    }

    @isTest
    static void testNonActive() {
        System.assertEquals(
            false,
            GATE__Gatekeeper.check('PIMInactive'),
            'Failure in active test'
        );
    }

    @isTest
    static void testPercentage() {
        System.assertEquals(
            true,
            GATE__Gatekeeper.check('PIMPercentage'),
            'Failure: 100% test'
        );

        System.assertEquals(
            false,
            GATE__Gatekeeper.check('PIMPercentageZero'),
            'Failure: 0.0% test'
        );
    }
}
