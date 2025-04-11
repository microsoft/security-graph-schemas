// (:CERTIFICATE)-[:AUTHENTICATES]->(:AADAPPLICATION) 
MATCH (c:CERTIFICATE {thumbprint:"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"})
MATCH (a:AADAPPLICATION {objectid: "45ae62de-e120-43dc-b313-78d6b36cac73"})
CREATE (c)-[:AUTHENTICATES]->(a);

// (:CERTIFICATE)-[:AUTHENTICATES]->(:AADSERVICEPRINCIPAL) 
MATCH (c:CERTIFICATE {thumbprint:"BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"})
MATCH (a:AADSERVICEPRINCIPAL {objectid: "95d323dc-5544-4f6c-aa70-cd964f57926a"})
CREATE (c)-[:AUTHENTICATES]->(a);

// (:STORAGEACCOUNTKEY)-[:AUTHENTICATES]->(:STORAGEACCOUNT) 
MATCH (one:STORAGEACCOUNTKEY { id: "ed3299cb-cc49-499b-a5d3-141756ac6fcc"})
MATCH (two:STORAGEACCOUNT { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.storage/storageaccounts/storage-1"})
CREATE (one)-[:AUTHENTICATES]->(two);

// (:AADGROUP)-[:CONTAINS]->(:AADSERVICEPRINCIPAL) 
MATCH (one:AADGROUP { objectid: "b3afcee8-dba9-4834-b2dd-6223c95c93d3"})
MATCH (two:AADSERVICEPRINCIPAL { objectid: "95d323dc-5544-4f6c-aa70-cd964f57926a"})
CREATE (one)-[:CONTAINS]->(two);

// (:AADGROUP)-[:CONTAINS]->(:AADUSER) 
MATCH (one:AADGROUP { objectid: "b3afcee8-dba9-4834-b2dd-6223c95c93d3"})
MATCH (two:AADUSER { objectid: "b4db7920-8fb3-490a-9de3-c8b6c1c1fd76"})
CREATE (one)-[:CONTAINS]->(two);

// (:KUSTOCLUSTER)-[:CONTAINS]->(:KUSTODATABASE)
MATCH (one:KUSTOCLUSTER { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.kusto/clusters/samplecluster"})
MATCH (two:KUSTODATABASE { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.kusto/clusters/samplecluster/databases/sampledatabase"})
CREATE (one)-[:CONTAINS]->(two);

// (:KUSTODATABASE)-[:CONTAINS]->(:KUSTOTABLE)
MATCH (one:KUSTODATABASE { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.kusto/clusters/samplecluster/databases/sampledatabase"})
MATCH (two:KUSTOTABLE { name: "sampletable" })
CREATE (one)-[:CONTAINS]->(two);

// (:MANAGEMENTGROUP)-[:CONTAINS]->(:MANAGEMENTGROUP)
MATCH (one:MANAGEMENTGROUP { id: "d3274951-4883-45d7-94f0-4ceaa59ca668"})
MATCH (two:MANAGEMENTGROUP { id: "27974a3b-41fe-4115-9970-aced1e729807"})
CREATE (one)-[:CONTAINS]->(two);

// (:MANAGEMENTGROUP)-[:CONTAINS]->(:SUBSCRIPTION)
MATCH (one:MANAGEMENTGROUP { id: "27974a3b-41fe-4115-9970-aced1e729807" })
MATCH (two:SUBSCRIPTION { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482" })
CREATE (one)-[:CONTAINS]->(two);

// (:NETWORKSECURITYGROUP)-[:CONTAINS]->(:NETWORKSECURITYGROUPRULE)
MATCH (one:NETWORKSECURITYGROUP { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/networksecuritygroups/default-nsg" })
MATCH (two:NETWORKSECURITYGROUPRULE { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/networksecuritygroups/default-nsg/securityrules/https" })
CREATE (one)-[:CONTAINS]->(two);

// (:SUBSCRIPTION)-[:CONTAINS]->(:RESOURCEGROUP)
MATCH (one:SUBSCRIPTION { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482" })
MATCH (two:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "production" })
CREATE (one)-[:CONTAINS]->(two);

// (:SUBSCRIPTION)-[:CONTAINS]->(:RESOURCEGROUP)
MATCH (one:SUBSCRIPTION { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482" })
MATCH (two:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "devtest" })
CREATE (one)-[:CONTAINS]->(two);

// (:RESOURCEGROUP)-[:CONTAINS]->(:APPSERVICEPLAN)
MATCH (one:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "production" })
MATCH (two:APPSERVICEPLAN { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.web/serverfarms/plan-1" })
CREATE (one)-[:CONTAINS]->(two);

// (:RESOURCEGROUP)-[:CONTAINS]->(:FUNCTIONAPP)
MATCH (one:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "production" })
MATCH (two:FUNCTIONAPP { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.web/sites/function-app-1"})
CREATE (one)-[:CONTAINS]->(two);

// (:RESOURCEGROUP)-[:CONTAINS]->(:KUSTOCLUSTER)
MATCH (one:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "production" })
MATCH (two:KUSTOCLUSTER { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.kusto/clusters/samplecluster" })
CREATE (one)-[:CONTAINS]->(two);

// (:RESOURCEGROUP)-[:CONTAINS]->(:LOADBALANCER)
MATCH (one:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "production" })
MATCH (two:LOADBALANCER { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/loadbalancers/lb-1" })
CREATE (one)-[:CONTAINS]->(two);

// (:RESOURCEGROUP)-[:CONTAINS]->(:NETWORKINTERFACE)
MATCH (one:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "production" })
MATCH (two:NETWORKINTERFACE { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/networkinterfaces/nic-1" })
CREATE (one)-[:CONTAINS]->(two);

// (:RESOURCEGROUP)-[:CONTAINS]->(:NETWORKSECURITYGROUP)
MATCH (one:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "production" })
MATCH (two:NETWORKSECURITYGROUP { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/networksecuritygroups/default-nsg" })
CREATE (one)-[:CONTAINS]->(two);

// (:RESOURCEGROUP)-[:CONTAINS]->(:PUBLICIPADDRESS)
MATCH (one:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "production" })
MATCH (two:PUBLICIPADDRESS { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/publicipaddresses/public-ip" })
CREATE (one)-[:CONTAINS]->(two);

// (:RESOURCEGROUP)-[:CONTAINS]->(:SERVICEFABRICCLUSTER)
MATCH (one:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "production" })
MATCH (two:SERVICEFABRICCLUSTER { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.servicefabric/clusters/sf-cluster-1"})
CREATE (one)-[:CONTAINS]->(two);

// (:RESOURCEGROUP)-[:CONTAINS]->(:MANAGEDIDENTITY)
MATCH (one:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "production" })
MATCH (two:MANAGEDIDENTITY {resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.managedidentity/userassignedidentities/msi-1" })
CREATE (one)-[:CONTAINS]->(two);

// (:RESOURCEGROUP)-[:CONTAINS]->(:STORAGEACCOUNT)
MATCH (one:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "production" })
MATCH (two:STORAGEACCOUNT { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.storage/storageaccounts/storage-1" })
CREATE (one)-[:CONTAINS]->(two);

// (:RESOURCEGROUP)-[:CONTAINS]->(:KEYVAULT)
MATCH (one:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "production" })
MATCH (two:KEYVAULT { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.keyvault/vaults/kv-1" })
CREATE (one)-[:CONTAINS]->(two);

// (:RESOURCEGROUP)-[:CONTAINS]->(:VIRTUALMACHINESCALESET)
MATCH (one:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "production" })
MATCH (two:VIRTUALMACHINESCALESET { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.compute/virtualmachinescalesets/vmss-1" })
CREATE (one)-[:CONTAINS]->(two);

// (:VIRTUALMACHINESCALESET)-[:CONTAINS]->(:VIRTUALMACHINE)
MATCH (one:VIRTUALMACHINESCALESET { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.compute/virtualmachinescalesets/vmss-1" })
MATCH (two:VIRTUALMACHINE { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.compute/virtualmachinescalesets/vmss-1/virtualmachines/0"})
CREATE (one)-[:CONTAINS]->(two);

// (:RESOURCEGROUP)-[:CONTAINS]->(:VIRTUALNETWORK)
MATCH (one:RESOURCEGROUP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482", name: "production" })
MATCH (two:VIRTUALNETWORK { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/virtualnetworks/vnet-1" })
CREATE (one)-[:CONTAINS]->(two);

// (:KEYVAULT)-[:CONTAINS]->(:KEYVAULTSECRETVERSION)
MATCH (one:KEYVAULT { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.keyvault/vaults/kv-1" })
MATCH (two:KEYVAULTSECRETVERSION { name: "server-certificate" })
CREATE (one)-[:CONTAINS]->(two);

MATCH (one:KEYVAULT { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.keyvault/vaults/kv-1" })
MATCH (two:KEYVAULTSECRETVERSION { name: "dev-certificate" })
CREATE (one)-[:CONTAINS]->(two);

MATCH (one:KEYVAULT { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.keyvault/vaults/kv-1" })
MATCH (two:KEYVAULTSECRETVERSION { name: "storage-key" })
CREATE (one)-[:CONTAINS]->(two);

// (:KEYVAULTSECRETVERSION)-[:CONTAINS]->(:CERTIFICATE)
MATCH (one:KEYVAULTSECRETVERSION { name: "server-certificate" })
MATCH (two:CERTIFICATE { thumbprint: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" })
CREATE (one)-[:CONTAINS]->(two);

MATCH (one:KEYVAULTSECRETVERSION { name: "dev-certificate" })
MATCH (two:CERTIFICATE { thumbprint: "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB" })
CREATE (one)-[:CONTAINS]->(two);

// (:KEYVAULTSECRETVERSION)-[:CONTAINS]->(:KEY)
MATCH (one:KEYVAULTSECRETVERSION { name: "storage-key" })
MATCH (two:KEY { id: "ed3299cb-cc49-499b-a5d3-141756ac6fcc" })
CREATE (one)-[:CONTAINS]->(two);

// (:VIRTUALNETWORK)-[:CONTAINS]->(:SUBNET)
MATCH (one:VIRTUALNETWORK { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/virtualnetworks/vnet-1" })
MATCH (two:SUBNET { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/virtualnetworks/vnet-1/subnets/subnet-1" })
CREATE (one)-[:CONTAINS]->(two);

// (:AADOBJECT)-[:HASACCESSPOLICY]->(:KEYVAULT)
MATCH (one:AADOBJECT { objectid: "2e0940af-4b34-463c-8c4c-7f30d8bff298" })
MATCH (two:KEYVAULT { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.keyvault/vaults/kv-1"})
CREATE (one)-[:HASACCESSPOLICY { permissions: '{"secrets": ["get", "list"]}' }]->(two);

MATCH (one:AADOBJECT { objectid: "b3afcee8-dba9-4834-b2dd-6223c95c93d3" })
MATCH (two:KEYVAULT { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.keyvault/vaults/kv-1"})
CREATE (one)-[:HASACCESSPOLICY { permissions: '{"secrets": ["all"], "certificates": ["all"]}' }]->(two);

// (:VIRTUALMACHINESCALESET)-[:HASIDENTITY]->(:MANAGEDIDENTITY)
MATCH (one:VIRTUALMACHINESCALESET { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.compute/virtualmachinescalesets/vmss-1" })
MATCH (two:MANAGEDIDENTITY { objectid: "2e0940af-4b34-463c-8c4c-7f30d8bff298"})
CREATE (one)-[:HASIDENTITY]->(two);

// (:VIRTUALMACHINE)-[:HASIDENTITY]->(:MANAGEDIDENTITY)
MATCH (one:VIRTUALMACHINE { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.compute/virtualmachinescalesets/vmss-1/virtualmachines/0" })
MATCH (two:MANAGEDIDENTITY { objectid: "2e0940af-4b34-463c-8c4c-7f30d8bff298"})
CREATE (one)-[:HASIDENTITY]->(two);

// (:FUNCTIONAPP)-[:HASIDENTITY]->(:MANAGEDIDENTITY)
MATCH (one:FUNCTIONAPP { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.web/sites/function-app-1" })
MATCH (two:MANAGEDIDENTITY { objectid: "2e0940af-4b34-463c-8c4c-7f30d8bff298"})
CREATE (one)-[:HASIDENTITY]->(two);

// (:PERSON)-[:HASIDENTITY]->(:AADUSER)
MATCH (one:PERSON { employeeid: "1" })
MATCH (two:AADUSER { objectid: "363d4e15-8a6e-4cad-b79f-05f8454ce266" })
CREATE (one)-[:HASIDENTITY]->(two);

MATCH (one:PERSON { employeeid: "2" })
MATCH (two:AADUSER { objectid: "b4db7920-8fb3-490a-9de3-c8b6c1c1fd76" })
CREATE (one)-[:HASIDENTITY]->(two);

// (:AADAPPLICATION)-[:HASPERMISSION]->(:AADAPPLICATION)
MATCH (one:AADAPPLICATION { objectid: "45ae62de-e120-43dc-b313-78d6b36cac73" })
MATCH (two:AADAPPLICATION { applicationid: "00000003-0000-0000-c000-000000000000" })
CREATE (one)-[:HASPERMISSION {type: "delegated", permissions: ["user.read.all"]}]->(two);

// (:AADOBJECT)-[:HASROLE]->(:KUSTOCLUSTER)
MATCH (one:AADOBJECT { objectid: "363d4e15-8a6e-4cad-b79f-05f8454ce266" })
MATCH (two:KUSTOCLUSTER { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.kusto/clusters/samplecluster" })
CREATE (one)-[:HASROLE {type:"entra", level: "cluster", rolename:"alldatabasesviewer"}]->(two);

// (:AADOBJECT)-[:HASROLE]->(:KUSTODATABASE)
MATCH (one:AADOBJECT { objectid: "b4db7920-8fb3-490a-9de3-c8b6c1c1fd76" })
MATCH (two:KUSTODATABASE { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.kusto/clusters/samplecluster/databases/sampledatabase" })
CREATE (one)-[:HASROLE {type:"entra", level: "database", rolename:"admin"}]->(two);

// (:AADOBJECT)-[:HASROLE]->(:VIRTUALMACHINESCALESET)
MATCH (one:AADOBJECT { objectid: "b3afcee8-dba9-4834-b2dd-6223c95c93d3"})
MATCH (two:ARMRESOURCE { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.compute/virtualmachinescalesets/vmss-1" })
CREATE (one)-[:HASROLE {roleassignmentid: "2627aad4-b817-4483-8621-3b0ef7c7053c", roleid: "b24988ac-6180-42a0-ab88-20f7382dd24c", rolename: "contributor"}]->(two);

// (:AADOBJECT)-[:HASROLE]->(:MANAGEMENTGROUP)
MATCH (one:AADOBJECT { objectid: "363d4e15-8a6e-4cad-b79f-05f8454ce266"})
MATCH (two:MANAGEMENTGROUP {})
CREATE (one)-[:HASROLE {roleassignmentid: "d3fadcbf-15b3-49fb-8f94-b5a48219044b", roleid: "b24988ac-6180-42a0-ab88-20f7382dd24c", rolename: "contributor"}]->(two);

// (:AADOBJECT)-[:HASROLE]->(:RESOURCEGROUP)
MATCH (one:AADOBJECT { objectid: "b4db7920-8fb3-490a-9de3-c8b6c1c1fd76"})
MATCH (two:RESOURCEGROUP { name: "production" })
CREATE (one)-[:HASROLE {roleassignmentid: "c704af49-b633-4f3f-92d1-ba09ad7b4afe", roleid: "b24988ac-6180-42a0-ab88-20f7382dd24c", rolename: "contributor"}]->(two);

// (:AADOBJECT)-[:HASROLE]->(:FUNCTIONAPP)
MATCH (one:AADOBJECT { objectid: "d086f766-9aab-4d73-bd4f-43179cc76daf" })
MATCH (two:FUNCTIONAPP { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482" })
CREATE (one)-[:HASROLE {roleassignmentid: "de719fa7-3076-4aaf-89ff-2a46e866594b", roleid: "acdd72a7-3385-48ef-bd42-f606fba81ae7", rolename: "reader"}]->(two);

// (:AADOBJECT)-[:HASROLE]->(:STORAGEACCOUNT)
MATCH (one:AADOBJECT { objectid: "d086f766-9aab-4d73-bd4f-43179cc76daf" })
MATCH (two:STORAGEACCOUNT { subscriptionid: "6f1f1005-d6cb-47de-b9c0-869454ba4482" })
CREATE (one)-[:HASROLE {roleassignmentid: "199ff977-47b8-4760-86dd-33c77e018bec", roleid: "ba92f5b4-2d11-453d-a403-e96b0029c9fe", rolename: "storage blob data contributor"}]->(two);

// (:AADOBJECT)-[:HASROLE]->(:TENANT)
MATCH (one:AADOBJECT { objectid: "363d4e15-8a6e-4cad-b79f-05f8454ce266" })
MATCH (two:TENANT { tenantid: "d3274951-4883-45d7-94f0-4ceaa59ca668" })
CREATE (one)-[:HASROLE {roleassignmentid: "c49adf77-e13b-4bef-bc1b-7095b78e818e", name: "global administrator", roletemplateid: "62e90394-69f5-4237-9190-012177145e10"}]->(two);

MATCH (one:AADOBJECT { objectid: "b4db7920-8fb3-490a-9de3-c8b6c1c1fd76" })
MATCH (two:TENANT { tenantid: "d3274951-4883-45d7-94f0-4ceaa59ca668" })
CREATE (one)-[:HASROLE {roleassignmentid: "019b1a4f-a085-4100-b910-26588f820ba1", name: "global reader", roletemplateid: "f2ef992c-3afb-46b9-b7cf-a126ee74c451"}]->(two);

// (:APPSERVICEPLAN)-[CONTAINS]->(:FUNCTIONAPP)
MATCH (one:APPSERVICEPLAN { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.web/serverfarms/plan-1" })
MATCH (two:FUNCTIONAPP { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.web/sites/function-app-1" })
CREATE (one)-[:CONTAINS]->(two);

// (:FUNCTIONAPP)-[:HASROUTE]->(:FUNCTION)
MATCH (one:FUNCTIONAPP { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.web/sites/function-app-1" })
MATCH (two:FUNCTION { url: "https://function-app-1.azurewebsites.net/api/inventory" })
CREATE (one)-[:HASROUTE {authlevel: "anonymous", methods: ["get", "post"], triggertype: "httptrigger"}]->(two);

// (:FUNCTIONAPP)-[:USES]->(:STORAGEACCOUNT)
MATCH (one:FUNCTIONAPP { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.web/sites/function-app-1" })
MATCH (two:STORAGEACCOUNT { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.storage/storageaccounts/storage-1"})
CREATE (one)-[:USES]->(two);

// (:NETWORKINTERFACE)-[:ISATTACHEDTO]->(:SUBNET)
MATCH (one:NETWORKINTERFACE { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/networkinterfaces/nic-1" })
MATCH (two:SUBNET { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/virtualnetworks/vnet-1/subnets/subnet-1" })
CREATE (one)-[:ISATTACHEDTO]->(two);

// (:NETWORKINTERFACE)-[:ISATTACHEDTO]->(:VIRTUALMACHINE)
MATCH (one:NETWORKINTERFACE { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/networkinterfaces/nic-1" })
MATCH (two:VIRTUALMACHINE { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.compute/virtualmachinescalesets/vmss-1/virtualmachines/0" })
CREATE (one)-[:ISATTACHEDTO]->(two);

// (:AADSERVICEPRINCIPAL)-[:ISINSTANCEOF]->(:AADAPPLICATION)
MATCH (one:AADSERVICEPRINCIPAL { objectid: "95d323dc-5544-4f6c-aa70-cd964f57926a" })
MATCH (two:AADAPPLICATION { objectid: "45ae62de-e120-43dc-b313-78d6b36cac73" })
CREATE (one)-[:ISINSTANCEOF]->(two);

// (:AADGROUP)-[:OWNS]->(:AADAPPLICATION)
MATCH (one:AADGROUP { objectid: "b3afcee8-dba9-4834-b2dd-6223c95c93d3" })
MATCH (two:AADAPPLICATION { objectid: "45ae62de-e120-43dc-b313-78d6b36cac73" })
CREATE (one)-[:OWNS]->(two);

// (:AADUSER)-[:OWNS]->(:AADAPPLICATION)
MATCH (one:AADUSER { objectid: "363d4e15-8a6e-4cad-b79f-05f8454ce266" })
MATCH (two:AADAPPLICATION { objectid: "45ae62de-e120-43dc-b313-78d6b36cac73" })
CREATE (one)-[:OWNS]->(two);

// (:AADUSER)-[:OWNS]->(:AADSERVICEPRINCIPAL)
MATCH (one:AADOBJECT { objectid: "b4db7920-8fb3-490a-9de3-c8b6c1c1fd76" })
MATCH (two:AADSERVICEPRINCIPAL { objectid: "d086f766-9aab-4d73-bd4f-43179cc76daf" })
CREATE (one)-[:OWNS]->(two);

// (:NETWORKSECURITYGROUP)-[:PROTECTS]->(:SUBNET)
MATCH (one:NETWORKSECURITYGROUP {})
MATCH (two:SUBNET {})
CREATE (one)-[:PROTECTS]->(two);

// (:NETWORKSECURITYGROUP)-[:PROTECTS]->(:NETWORKINTERFACE)
MATCH (one:NETWORKSECURITYGROUP { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/networksecuritygroups/default-nsg" })
MATCH (two:NETWORKINTERFACE { resourceid: "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/networkinterfaces/nic-1" })
CREATE (one)-[:PROTECTS]->(two);

// (:PERSON)-[:REPORTSTO]->(:PERSON)
MATCH (one:PERSON { employeeid: "2" })
MATCH (two:PERSON { employeeid: "1" })
CREATE (one)-[:REPORTSTO]->(two);