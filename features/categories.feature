Feature: Create and Edit Categories
	As a blog administrator
	In order to organize blog posts
	I want to be able to create and edit categories

Background:
	Given the blog is set up
	And I am logged into the admin panel
	And the following categories exist:
	|	name	|
	|	Fruit	|
	|	Sports	|

Scenario: Create categories
	When I follow "Categories"
	Then I should see "Categories"
	When I fill in the following:
		| Name			|  Pets				|
		| Keywords		|  Dog				|
		| Permalink		|  Pets				|
		| Description	| Posts about Pets 	|
	And I press "Save"
	Then I should see "Categories"
	And I should see "Pets"

Scenario: Edit Categories
	When I follow "Categories"
	And I am on the edit page for category "Fruit"
	And I fill in "Name" with "Food"
	And I press "Save"
	Then I should see "Categories"
	And I should see "Food"
	And I should not see "Fruit"