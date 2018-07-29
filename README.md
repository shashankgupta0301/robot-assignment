
# robot-assignment

================================================
************* ROBOT ENVIRONMENT SETUP ************* 
  pip install robotframework
  pip install robotframework-requests
  Activate the intellbot-selenium2patched plugin in pycharm

================================================

************* CRUD APPLICATION SETUP ************* 
### Steps to Setup CRUD Application

      ##  Install virtualenv
      C:\Users\user>pip install virtualenv
      
      ##  Create Virtualenv
      C:\development>virtualenv crud
      New python executable in C:\development\crud\Scripts\python.exe
      Installing setuptools, pip, wheel...done.

      ##  Activate Virtual Environment
      C:\development\crud\Scripts>activate

      ## Install Django & Djangorestframework
      (crud) C:\development\crud\Scripts>pip install Django==1.11 djangorestframework==3.8.2

      ##  Start Django Server
      cd C:\development\crud_app
      C:\development\crud_app>python manage.py runserver


### CRUD Operations and verbs Supported by Django App
      ${BaseURI}      http://127.0.0.1:8000
      GET List: /apis/emp_list/
      GET Specific: /apis/emp_list/{id}/
      PUT :/apis/emp_list/{id}/edit/
      POST: /apis/create/
      DELETE: /apis/emp_list/{id}/delete/


### CRUD Robot Test Files
    Resources/crud_common.robot
    Tests/crud_userdata.robot
    Tests/crud_test.robot
    Results/crud_results/log.html
    Results/crud_results/report.html
    Results/crud_results/output.xml
    
     
================================================ 
************* OMDB API APPLICATION *************
### OMDB URL: http://www.omdbapi.com/
### OMDB API Robot Test Files
    Resources/omdb_common.robot
    Tests/omdb_userdata.robot
    Tests/omdb_test.robot
    Results/omdb_results/log.html
    Results/omdb_results/report.html
    Results/omdb_results/output.xml
================================================
