CREATE (app:AADAPPLICATION :AADOBJECT)
SET app.allowspassthrough = true,
    app.appidentifieruris = ["https://myapp"],
    app.applicationid = "8dc4e2f2-7502-4a0b-84e3-1f309cdc3297",
    app.name = "MyApp",
    app.ispubliclient = true,
    app.objectid = "45ae62de-e120-43dc-b313-78d6b36cac73",
    app.replyurls = ["https://myapp.contoso.com"],
    app.signinaudience = "AAD All Tenants",
    app.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (app:AADAPPLICATION :AADOBJECT)
SET app.allowspassthrough = false,
    app.appidentifieruris = ["https://graph.microsoft.com"],
    app.applicationid = "00000003-0000-0000-c000-000000000000",
    app.name = "Microsoft Graph",
    app.ispublicclient = true,
    app.objectid = "6a3c544c-43af-49e0-94f6-e7b88242670f",
    app.replyurls = ["https://graph.microsoft.com"],
    app.signinaudience = "AAD All Tenants",
    app.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (group:AADGROUP :AADOBJECT) 
SET group.name = "MyGroup",
    group.expirationdatetime = "2298-10-15T09:31:45Z",
    group.mail = "mygroup@contoso.com",
    group.mailenabled = true,
    group.mailnickname = "mygroup",
    group.objectid = "b3afcee8-dba9-4834-b2dd-6223c95c93d3",
    group.securityenabled = false,
    group.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (spn:AADSERVICEPRINCIPAL :AADOBJECT)
SET spn.objectid = "95d323dc-5544-4f6c-aa70-cd964f57926a",
    spn.enabled = true,
    spn.applicationid = "8dc4e2f2-7502-4a0b-84e3-1f309cdc3297",
    spn.appownertenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668",
    spn.name = "myapp",
    spn.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";
    
CREATE (spn:AADSERVICEPRINCIPAL :AADOBJECT)
SET spn.objectid = "d086f766-9aab-4d73-bd4f-43179cc76daf",
    spn.enabled = true,
    spn.applicationid = "ad94d29a-4cbf-4adc-9dc0-285ab7ed7859",
    spn.appownertenantid = "fe374a17-2be5-4198-8585-7ca3b02d2217",
    spn.name = "theirapp",
    spn.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (user:AADUSER :AADOBJECT) 
SET user.enabled = true,
    user.name = "Example CEO",
    user.domain = "contoso.com",
    user.employeeid = "1",
    user.mail = "ceo@contoso.com",
    user.objectid = "363d4e15-8a6e-4cad-b79f-05f8454ce266",
    user.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668",
    user.userprincipalname = "ceo@contoso.com";

CREATE (user:AADUSER :AADOBJECT) 
SET user.enabled = true,
    user.name = "Example Engineer",
    user.domain = "contoso.com",
    user.employeeid = "2",
    user.mail = "someone@contoso.com",
    user.objectid = "b4db7920-8fb3-490a-9de3-c8b6c1c1fd76",
    user.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668",
    user.userprincipalname = "someone@contoso.com";

CREATE (cert1:CERTIFICATE)
SET cert1.isselfsigned = false, 
    cert1.issuer = "Certificate Authority A",
    cert1.serialnumber = "123456789",
    cert1.subject = "server.contoso.com",
    cert1.subjectalternativename = "example.azurewebsites.net",
    cert1.thumbprint = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
    cert1.validfrom = "2025-01-01",
    cert1.validto = "2026-01-01";

CREATE (cert2:CERTIFICATE)
SET cert2.isselfsigned = true, 
    cert2.issuer = "localhost", 
    cert2.serialnumber = "987654321", 
    cert2.subject = "localhost", 
    cert2.thumbprint = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB", 
    cert2.validfrom = "2024-06-15", 
    cert2.validto = "2025-06-15";

CREATE (kustocluster:KUSTOCLUSTER :ARMRESOURCE) 
SET kustocluster.region = "westus2",
    kustocluster.name = "Kusto Cluster",
    kustocluster.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.kusto/clusters/samplecluster",
    kustocluster.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    kustocluster.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (kustodatabase:KUSTODATABASE :ARMRESOURCE) 
SET kustodatabase.region = "westus2",
    kustodatabase.name = "Kusto Database",
    kustodatabase.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.kusto/clusters/samplecluster/databases/sampledatabase",
    kustodatabase.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    kustodatabase.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (kustotable:KUSTOTABLE) 
SET kustotable.name = "sampletable";

CREATE (lb:LOADBALANCER :ARMRESOURCE) 
SET lb.isinternal = false,
    lb.region = "westus2",
    lb.name = "lb-1",
    lb.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/loadbalancers/lb-1",
    lb.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    lb.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (mg:MANAGEMENTGROUP) 
SET mg.name = "Tenant Root Group",
    mg.id = "d3274951-4883-45d7-94f0-4ceaa59ca668",
    mg.resourceid = "/providers/microsoft.management/managementgroups/d3274951-4883-45d7-94f0-4ceaa59ca668",
    mg.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (mg:MANAGEMENTGROUP) 
SET mg.name = "Engineering",
    mg.id = "27974a3b-41fe-4115-9970-aced1e729807",
    mg.resourceid = "/providers/microsoft.management/managementgroups/27974a3b-41fe-4115-9970-aced1e729807",
    mg.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (a:NETWORKINTERFACE :ARMRESOURCE) 
SET a.region = "westus2",
    a.name = "nic-1",
    a.privateips = ["10.1.0.16"],
    a.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/networkinterfaces/nic-1",
    a.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    a.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (nsg:NETWORKSECURITYGROUP :ARMRESOURCE)
SET nsg.region = "westus2",
    nsg.name = "default-nsg",
    nsg.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/networksecuritygroups/default-nsg",
    nsg.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    nsg.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (ceo:PERSON)
SET ceo.name = "Example CEO",
    ceo.employeeid = "1",
    ceo.mail = "ceo@contoso.com";

CREATE (engineer:PERSON)
SET engineer.name = "Example Engineer",
    engineer.employeeid = "2",
    engineer.mail = "someone@contoso.com";

CREATE (pip:PUBLICIPADDRESS :ARMRESOURCE) 
SET pip.ipaddress = "192.0.2.0",
    pip.region = "westus2",
    pip.version = "ipv4",
    pip.name = "public-ip",
    pip.allocationmethod = "dynamic",
    pip.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/publicipaddresses/public-ip",
    pip.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    pip.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (rg:RESOURCEGROUP) 
SET rg.name = "production",
    rg.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    rg.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (rg:RESOURCEGROUP) 
SET rg.name = "devtest",
    rg.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    rg.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (nsgrule:NETWORKSECURITYGROUPRULE :ARMRESOURCE) 
SET nsgrule.access = "allow",
    nsgrule.destinationaddressprefixes = ["*"],
    nsgrule.destinationapplicationsecuritygroups = [],
    nsgrule.destinationportranges = ["443"],
    nsgrule.direction = "inbound",
    nsgrule.region = "westus2",
    nsgrule.name = "https",
    nsgrule.priority = "500",
    nsgrule.protocol = "tcp",
    nsgrule.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/networksecuritygroups/default-nsg/securityrules/https",
    nsgrule.sourceaddressprefixes = ["internet"],
    nsgrule.sourceapplicationsecuritygroups = [],
    nsgrule.sourceportranges = ["443"],
    nsgrule.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    nsgrule.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (secret1:KEYVAULTSECRETVERSION ) 
SET secret1.name = "server-certificate",
    secret1.contenttype = "application/x-pkcs12",
    secret1.created = "2025-01-01",
    secret1.validfrom = "2025-01-01",
    secret1.validto = "2026-01-01",
    secret1.version = "1"; 

CREATE (secret2:KEYVAULTSECRETVERSION ) 
SET secret2.name = "dev-certificate",
    secret2.contenttype = "application/x-pkcs12",
    secret2.created = "2024-06-15",
    secret2.validfrom = "2024-06-15",
    secret2.validto = "2025-06-15",
    secret2.version = "1";

CREATE (secret3:KEYVAULTSECRETVERSION ) 
SET secret3.name = "storage-key",
    secret3.contenttype = "plaintext",
    secret3.created = "2024-03-01T18:26:47Z",
    secret3.validfrom = "2024-03-01T18:26:47Z",
    secret3.validto = "",
    secret3.version = "1";

CREATE (servicefabric:SERVICEFABRICCLUSTER :ARMRESOURCE) 
SET servicefabric.region = "westus2",
    servicefabric.name = "sf-cluster-1",
    servicefabric.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.servicefabric/clusters/sf-cluster-1",
    servicefabric.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    servicefabric.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (f:FUNCTION ) 
SET f.name = "inventory",
    f.route = "api/inventory",
    f.url = "https://function-app-1.azurewebsites.net/api/inventory";

CREATE (app:FUNCTIONAPP :ARMRESOURCE) 
SET app.region = "westus2",
    app.name = "function-app-1",
    app.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.web/sites/function-app-1",
    app.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    app.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (plan:APPSERVICEPLAN :ARMRESOURCE) 
SET plan.region = "westus2",
    plan.name = "plan-1",
    plan.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.web/serverfarms/plan-1",
    plan.slotnames = ["development"],
    plan.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    plan.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (key:STORAGEACCOUNTKEY :KEY)
SET key.id = "ed3299cb-cc49-499b-a5d3-141756ac6fcc",
    key.contenttype = "SEC101/106",
    key.notbefore = "2024-03-01T18:26:47Z",
    key.notafter = "";

CREATE (storage:STORAGEACCOUNT :ARMRESOURCE) 
SET storage.region = "westus2",
    storage.name = "storage-1",
    storage.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.storage/storageaccounts/storage-1",
    storage.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    storage.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (subnet:SUBNET :ARMRESOURCE) 
SET subnet.addressprefixes = ["10.224.0.0/20"],
    subnet.region = "westus2",
    subnet.name = "subnet-1",
    subnet.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/virtualnetworks/vnet-1/subnets/subnet-1",
    subnet.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    subnet.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (sub:SUBSCRIPTION)
SET sub.created = "2020-03-30",
    sub.name = "Engineering Subscription",
    sub.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    sub.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (tenant:TENANT) 
SET tenant.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668",
    tenant.name = "Contoso, Ltd.";

CREATE (msi:MANAGEDIDENTITY :ARMRESOURCE :AADSERVICEPRINCIPAL :AADOBJECT)
SET msi.region = "westus2",
    msi.name = "msi-1",
    msi.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.managedidentity/userassignedidentities/msi-1",
    msi.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    msi.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668",
    msi.objectid = "2e0940af-4b34-463c-8c4c-7f30d8bff298",
    msi.type = "userassigned";

CREATE (kv:KEYVAULT :ARMRESOURCE) 
SET kv.isrbacenabled = true,
    kv.region = "westus2",
    kv.name = "kv-1",
    kv.networkacls = "{ \"Bypass\": \"AzureServices\", \"IpRules\": [\"10.224.0.0/20\"] }",
    kv.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.keyvault/vaults/kv-1",
    kv.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    kv.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (vmss:VIRTUALMACHINESCALESET :ARMRESOURCE)
SET vmss.region = "westus2",
    vmss.name = "vmss-1",
    vmss.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.compute/virtualmachinescalesets/vmss-1",
    vmss.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    vmss.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (vm:VIRTUALMACHINE :ARMRESOURCE)
SET vm.region = "westus2",
    vm.name = "0",
    vm.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.compute/virtualmachinescalesets/vmss-1/virtualmachines/0",
    vm.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    vm.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";

CREATE (vnet:VIRTUALNETWORK :ARMRESOURCE)
SET vnet.addressprefixes = ["10.224.0.0/16"],
    vnet.region = "westus2",
    vnet.name = "vnet-1",
    vnet.resourceid = "/subscriptions/6f1f1005-d6cb-47de-b9c0-869454ba4482/resourcegroups/production/providers/microsoft.network/virtualnetworks/vnet-1",
    vnet.subscriptionid = "6f1f1005-d6cb-47de-b9c0-869454ba4482",
    vnet.tenantid = "d3274951-4883-45d7-94f0-4ceaa59ca668";