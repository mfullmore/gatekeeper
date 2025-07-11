/**
 * @description Gatekeeper is a service that lets you add code paths to your code and configure those paths without a code release
 * This depoyment of Gatekeeper will only respect configuration changes in each org. Next steps are to make
 * Gatekeeper global. We can do this by using Heroku as the storage and SFDC cache in orgs.
 *
 * @group Gatekeeper
 * @since 2020
 * @author mike.542@gmail.com
 */

public without sharing class Gatekeeper {

    public static Gatekeeper staticGate { get; private set; }

    private Map<String, Gatekeeper__mdt> gatekeeperMap { get; set; }

    public Gatekeeper() {
        this.gatekeeperMap = Gatekeeper__mdt.getAll();
    }

    public static Boolean check(String pName) {
        if (Gatekeeper.staticGate == null) {
            Gatekeeper.staticGate = new Gatekeeper();
        }

        return Gatekeeper.check(pName, Gatekeeper.staticGate);
    }

    private static Boolean check(String pName, Gatekeeper pGateObj) {
        Gatekeeper__mdt gate;

        if (pName == null || pName == '') {
            return false;
        }

        if (pGateObj.gatekeeperMap.containsKey(pName)) {
            gate = pGateObj.gatekeeperMap.get(pName);
        } else {
            return false;
        }

        if (!gate.Active__c) {
            return false;
        }

        if (Gatekeeper.isInUsernames(gate.Usernames__c)) {
            return true;
        } else if (Gatekeeper.isInPercentage(gate.Percentage__c, pGateObj)) {
            return true;
        } else {
            return false;
        }
    }

    private static Boolean isInUsernames(String pUsernames) {
        Set<String> usernameSet = new Set<String>();

        if (pUsernames == null) {
            return false;
        }

        for (String username : pUsernames.split(',')) {
            usernameSet.add(username);
        }

        if (usernameSet.contains(UserInfo.getUserName())) {
            return true;
        } else {
            return false;
        }
    }

    private static Boolean isInPercentage(
        Decimal pPercentage,
        Gatekeeper pGateObj
    ) {
        Integer randomNumber = Integer.valueof((Math.random() * 100));

        if (pPercentage == 100.0) {
            return true;
        }

        if (pPercentage == 0.0) {
            return false;
        }

        if (randomNumber < Integer.valueOf(pPercentage)) {
            return true;
        } else {
            return false;
        }
    }
}
