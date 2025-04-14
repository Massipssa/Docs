RESOURCE_GROUP="test-rg"
az  deployment group create -g $RESOURCE_GROUP \
    --template-file output.json > result_output.json \
    --paramerters @output.paramerters-dev.json \
    --paramerters parameterName=value # override parameter