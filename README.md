# Sprints Flutter Task 7
Fetch employee data using Dio and implement error handling using try-catch then parse JSON responses and map them to model then cache the employee list locally.

## Task content

this project contains 2 screen
1. employee list screen:
   this screen contains a list of employees retrieved from an api using the dio package
    and cached using shared preferences
    each list item is a card containing an employee's id, full name (first and last names), and their salary
2. employee data screen:
    when pressing an employee card the app navigates to this screen passing the selected user from the list screen to this one and displays more details about the employee
    including:
     Full Name, 
     Age, 
     Email, 
     Contact Number, 
     Salary, 
     Date Of Birth, 
     Address, 
            
 packages used

 [Dio](https://pub.dev/packages/dio).

 [Shared Preferences](https://pub.dev/packages/shared_preferences).