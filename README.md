## InternTN
InternTN was a group project made in 2023 for the students of telecom nancy that used the school databse to facilitate the search for an internship.
The highlight of this project was the use of the openAI api to determine the field of each company to make a better search engine.

(this repo only contains dummy data to show the website in it's minimal working state)

## The Database File :
The databse file is written with sqlite3 and is complient with the UML model (uml.svg)
it contains the 5 tables from the UML with subtle differences

To have a major look at it you can use DB Browser (or database viewer in vsc) like seen in the exemple below :
![image info](./README/dbbrowser.png)

# db browser is availible to install with apt on linux or simple install from windows

## Templates File:
(temp files) stages2.html and recherche2.html  are  modified versions of stages.html ans recherche2.html respectively.

## Demonstration
The website is powered by the Flask framework (python required)
All requirements are inside the requirements.txt -> ```pip install ./requirements.txt```
launch the flask_app.py file 
open your internet browser and connect to your localhost at the correct {port} (found in the python terminal)
url will be something like http://localhost:{port}/recherche

once on the website you can write in uppercase in the category input "1A" "2A" or "3A"

there is a google talents integration that's light
it just copies the url and injects it into the jobs part of google 

# Exemple
First Page:
![image](https://github.com/user-attachments/assets/b3d739b5-accd-4a67-9ca1-2e4a49a036c8)
Search Engine:
![image](https://github.com/user-attachments/assets/209e2e04-d873-4893-99f6-69327c4b7fed)
Results Page:
![image](https://github.com/user-attachments/assets/55b52b82-e33f-4432-a389-76e5dc35654b)
