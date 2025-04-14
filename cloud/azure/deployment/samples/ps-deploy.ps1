$rg = 'test-rg'
$storagaName = 'amrtestmassistorage'
$storageSKU = 'Standard_GRS'

New-AzResourceGroup -Name $rg -Location east-us -Force
New-AzResourceGroupDeployment `
    -Name 'new-storage' `
    -ResourceGroupName $rg `
    -TemplateFile 'example.json' `
    -storageName $storagaName `
    -storageSKU $storageSKU