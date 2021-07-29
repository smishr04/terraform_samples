$ObjectId = "<id_1>","<id_2>"

foreach ($eachObjectId in $ObjectId) { New-AzRoleAssignment -ObjectId $eachObjectId -RoleDefinitionName "contributor" -Scope "/subscriptions/<subscription_id" }
