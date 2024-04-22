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


# add local repo to the azure
az webapp deployment source config-local-git --name dpJsApp --resource-group dpJsAppResourceGroup

git remote add azure https://dpjsapp.scm.azurewebsites.net/dpjsapp.git

# git pwd, user can be found in the app service > dpJsApp
git push azure main:master

# stop the webapp
az webapp stop --resource-group dpJsAppResourceGroup --name dpJsApp
