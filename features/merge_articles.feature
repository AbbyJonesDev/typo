Feature: Merge Articles
  As a blog administrator
  In order to consolidate information for readers
  I want to be able to merge articles on the same topic

  Background:
    Given the blog is set up

    And the following users exist:
    | login  |  password  |  name        | profile_id |
    | admin  |  aaaaaaaa  | George Lucas |  1         |
    | ridley |      2     | Ridley Scott |  2         |
    | aito   |      3     | Aito         |  3         |
    
     And the following articles exist:
    | allow_comments| author  | body  | guid | id | post_type | published | password | title | type    | user_id |       
    | true          | Dickens | live  | aaaa |  1 | read      | true      | ''       | t1    | Article | 1       |
    | true          | Poe     | laugh | bbbb |  2 | read      | true      | ''       | t2    | Article | 2       |
    | true          | Achebe  | love  | cccc |  3 | read      | true      | ''       | t3    | Article | 3       |

  Scenario: Merging articles from article's edit page
    Given I am logged into the admin panel
    And I am on the edit page for "t1"
    Then I should see "Merge Articles"
    When I fill in the following:
    | merge_with | 2 |
    And I press "Merge"
    Then I am on the Manage Articles page
    And I should see "t1"
    And I should not see "t2"
    And I should see "Dickens"
    And I should not see "Poe"

  Scenario: Non-admin user should not be able to merge articles
    Given I am logged in as "ridley"
    Then I should not see "Merge Articles"



    

   
    
  





