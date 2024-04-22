export subscriptionID=31cf302a-3c43-4365-b600-bd04a79913ce

# get the location list
az account list-locations

# Resource Group creation
az group create --name dpJsAppResourceGroup --location northeurope

# list all
az group list

# list a single item
az group show --name dpJsAppResourceGroup

# deploy our new app
export templateFile="freetpl.json"
export devParameterFile="freeparam.json"
az deployment group create \
  --name jsdevenvironment \
  --resource-group dpJsAppResourceGroup \
  --template-file $templateFile \
  --parameters $devParameterFile