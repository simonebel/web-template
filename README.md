# Web-template

A simple template for setting up a web application with React, MUI, FastAPi and SQlite/Alembic. Useful to speed up the development of any web application.

## Disclaimer

This template has been developped and tested on Linux. If you are intersted to use it on Windows or Mac OSx, feel free to open an issue.

# How to use

## Requirements

- [Conda](https://docs.conda.io/projects/conda/en/latest/commands/install.html) or [miniConda](https://docs.conda.io/projects/miniconda/en/latest/miniconda-install.html)
- [Node.js](https://nodejs.org/en/download)

## Installation

- Clone the project

  ```
  git clone https://github.com/simonebel/web-template.git
  cd web-template
  ```

- Copy the content of the template to an other folder/repo.

  ```
  bash bin/copy --dir <MY_DIR_PATH>
  cd <MY_DIR_PATH>
  ```

- Set-up the dependencies.

  ```
  bash bin/install --dir <MY_DATA_DIR> --conda <MY_CONDA_ENV_NAME>
  ```

- You can now push it to a new repo.

  ```
  git push <MY_REPO_URL>
  ```

## Runtime

- At each runtime, run :

  ```
  source set-env.sh
  ```
