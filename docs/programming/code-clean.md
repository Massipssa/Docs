## Linter

Inspects your code and five you feedback about it.

- **Flake8**
    - Errors
        - [E***/W***:](https://pep8.readthedocs.io/en/latest/intro.html#error-codes) pep8 errors and warnings
        - [F***:](https://flake8.pycqa.org/en/2.0/warnings.html) PyFlakes codes (see below)
        - C9**: McCabe complexity plugin mccabe
        - [N8**:](https://github.com/PyCQA/pep8-naming) Naming Conventions plugin pep8-naming
    - Configs
        - See the [link](https://flake8.pycqa.org/en/latest/user/options.html)
    - The configs add defined in
        - ``.flake8`` file in root folder
        - ``setup.cfg`` under the section ``[flake8]``