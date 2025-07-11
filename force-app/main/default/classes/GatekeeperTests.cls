/**
 * @description Here are some tests
 * @group Testing
 * @since 2020
 * @author mike.542@gmail.com
 */

@isTest
private class GatekeeperTests {

    @isTest
    static void testNullName() {
        System.assertEquals(
            false,
            Gatekeeper.check(null),
            'Failure null check'
        );

        System.assertEquals(
            false,
            Gatekeeper.check(''),
            'Failure empty string check'
        );
    }

    @isTest
    static void testNotThere() {
        System.assertEquals(
            false,
            Gatekeeper.check('never_call_your_feature_this_test'),
            'Failure name not there test'
        );
    }

    @isTest
    static void testNonActive() {
        System.assertEquals(
            false,
            Gatekeeper.check('Inactive'),
            'Failure in active test'
        );
    }

    @isTest
    static void testPercentage() {
        System.assertEquals(
            true,
            Gatekeeper.check('Percentage'),
            'Failure: 100% test'
        );

        System.assertEquals(
            false,
            Gatekeeper.check('PercentageZero'),
            'Failure: 0.0% test'
        );
    }
}
