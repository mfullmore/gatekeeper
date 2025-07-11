# Gatekeeper - for Salesforce

I spent four years at Meta—well, we called it Facebook then—building internal business applications on the Salesforce.com platform. One internal tool that made a lasting impression on me was Gatekeeper.

Gatekeeper is what Facebook used (and likely still uses) to control how new features are deployed to production. It allowed teams to gradually roll out changes, perform A/B testing, and roll back features instantly—without requiring a code deployment. That level of deployment control is something I’ve always felt was missing on the Salesforce platform.

So I built Gatekeeper for Salesforce—a simple but powerful feature flagging and code pathing framework tailored for Salesforce environments.

## Use Cases:

- Toggle new features on or off in any Salesforce org.
- Roll out features to a subset of users based on profile, role, username, or percentage of total users.
- Perform safe A/B testing of logic paths.
- Let individual users test a feature before full rollout.
- Validate new processes at production scale—without exposing them to everyone.

## How to user Gatekeeper

### 1. Deploy the Code
Copy the Gatekeeper classes into your SFDX project. (If enough people are interested, I’ll publish it as a managed package.)

### 2. Create a Gate
Add a record in the Custom Metadata Type: GATE__Gatekeeper__mdt. Use a unique name like my_new_feature.

### 3. Define Your Access Rules
Populate any combination of the following fields on the record:
- Username
- Profile
- Role
- Percentage

Set the record as Active.

### 4. Use the Gate in Your Code
Example:
```
if (GATE__Gatekeeper.check('my_new_feature)) {
    NewCustomApexClass.newFeatureMethod(Trigger.new);
} else {
    OldCustomApexClass.oldFeatureMethod(Trigger.new);
}
```

## A Note from the Author
If you made it to the end of this README—thank you! I’ve sat on this repo for three years, even though I use this code every day at work. Updating this README in July 2025 is part of my New Year’s resolution to contribute more and share the tools I believe in.

If you find Gatekeeper useful, please ⭐️ the repo, file issues, or contribute improvements. Feedback is always welcome!
