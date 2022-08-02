# Salesforce Gatekeeper

Gatekeeper is a code pathing tool used to roll out new features in production with the ability to roll back a feature without a code deploy.

## Use Cases:

- Code path features to turn them off or on in production
- Limited rollout of new features
- A/B testing
- Request feedback on a feature before it is fully baked
- Test a new process with production scale

## How to user Gatekeeper

- Create a Custom Metadata Gatekeeper__mdt record with a unique name.
- Decide what kind of users you want in your gate.
- Add the gate check to your code.
```
GATE__Gatekeeper.check('my_gate_name'); // this returns a boolean
```

## Updates to Gatekeeper

- Implement Gatekeeper for javascript LWC
- Add logging for A/B testing and to know when gates fail

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
