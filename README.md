# Apex_Trigger_Scenarios

# Basic Trigger Interview Scenarios
## 1. Contact–Account Industry Check
### Scenario: When a new Contact is inserted, if the related Account's Industry is "Banking", set the Contact’s Description field to “Banking Client”.

## 2. Prevent Duplicate Account Names
### Scenario: Prevent users from inserting an Account with a name that already exists (case-insensitive).

## 3. Auto-Copy Billing Address
### Scenario: When a Contact is created and linked to an Account, copy the Account's Billing Address to the Contact's Mailing Address.

## 4. Update Account When Contact is Updated
### Scenario: When a Contact’s Email is changed, update the related Account’s Last_Contact_Change__c (custom field) with today’s date.

## 5. Count Open Opportunities
### Scenario: When an Opportunity is inserted or updated, count the number of Open Opportunities related to the same Account and store it in Open_Opportunity_Count__c (custom field on Account).

## 6. Prevent Deletion of High-Value Opportunities
### Scenario: Prevent deletion of Opportunities where Amount > 100,000.

## 7. Auto-create Task on Lead Creation
### Scenario: When a new Lead is inserted, automatically create a Task to follow up after 3 days.

## 8. Default Stage on Opportunity Creation
### Scenario: When a new Opportunity is inserted, and Stage is not set, default it to "Prospecting".

## 9. Update Parent Case Status
### Scenario: When a child Case is closed, check if all child Cases of the parent are closed. If so, close the parent Case too.

## 10. Add Contact Role on Opportunity Creation
### Scenario: When a new Opportunity is inserted, if it is linked to an Account with a primary Contact, add that Contact as an Opportunity Contact Role with role = "Decision Maker".
