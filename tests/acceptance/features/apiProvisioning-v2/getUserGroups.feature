@api
Feature: get user groups
As an admin
I want to be able to get groups
So that I can manage group membership

	Background:
		Given using API version "2"

	Scenario: getting groups of an user
		Given user "brand-new-user" has been created
		And group "unused-group" has been created
		And group "new-group" has been created
		And group "0" has been created
		And group "Finance (NP)" has been created
		And group "admin:Pokhara@Nepal" has been created
		And group "Mgmt/Sydney" has been created
		And user "brand-new-user" has been added to group "new-group"
		And user "brand-new-user" has been added to group "0"
		And user "brand-new-user" has been added to group "Finance (NP)"
		And user "brand-new-user" has been added to group "admin:Pokhara@Nepal"
		And user "brand-new-user" has been added to group "Mgmt/Sydney"
		When user "admin" sends HTTP method "GET" to API endpoint "/cloud/users/brand-new-user/groups"
		Then the groups returned by the API should be
			| new-group           |
			| 0                   |
			| Finance (NP)        |
			| admin:Pokhara@Nepal |
			| Mgmt/Sydney         |
		And the OCS status code should be "200"
		And the HTTP status code should be "200"
