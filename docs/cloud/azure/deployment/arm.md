# Azure Resource Manager

## Concepts

- Offers multiple deployment interfaces
- Centralized layer
- Secured with Azure AD

## Format

- Parameters
- Variables
- Resources
- Outputs: returns output from template execution
- Functions

## Tool to use

- Template deployment
- VSCode
    - Azure Resource Manager Tools
    - ARM Template Viewer

## Deployement

- Powershell
    - Connect to account ``Connect-AzAccount``
    - Run the scrpit ``ps-deploy.ps1``

- Cloud Shell
- Template deployment

## Parametrization

- Expression: dymamically executed code
- Parameters:
    - Provide input values
    - Can be provided within the template file or in separate parameter file
- Variables: calculated values, centralization of all calculated values

## Copy

- Duplicate resource multiple time using one template

## Links

- [Azure git](https://github.com/Azure/azure-quickstart-templates)