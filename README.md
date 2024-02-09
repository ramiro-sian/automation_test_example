# Nozzmo Website Test Automation
[Build 1.0]

## Installation

Download and install python 3

Install the dependencies 

```sh
$ cd to_project_path/automation_test_example
$ pip install -r requirements.txt
```


Run test 
```sh
$ robot -d --outputdir .   
$ robot --include  Tags
$ robot --exclude  Tags 

# execute test cases failed in previous run (saved in output.xml)
$ robot --rerunfailed output.xml .

# execute test cases with failed test cases in previous run (saved in output.xml)
$ robot --rerunfailedsuites output.xml .