# Obey the Testing Goat Practice Conda Environment
## Installation
`git clone https://github.com/jfishe/obeytdd.git`

## Install geckoserver


## Setup Conda Environment
The conda manual describes [exporting the environment file](https://conda.io/docs/user-guide/tasks/manage-environments.html#exporting-the-environment-file) which is available in [conda/environment.yml](file:conda/environment.yml).
2. [To create the environment from the environment.yml file](https://conda.io/docs/user-guide/tasks/manage-environments.html#creating-an-environment-from-an-environment-yml-file), open Anaconda Prompt and enter the following.

        ``` DOS
        conda env create -f conda/environment.yml
        PowerShell ".\conda\make_tdd_prompt.ps1"
        activate tdd
        ```
