# Overview

This document provides several sample queries to run against the Neo4j database.

1. What are all the objects in my graph?

```
MATCH (n)
RETURN n
```

2. What's the reporting structure in this organization?

```
MATCH p = (employee:PERSON)-[:REPORTSTO]->(boss:PERSON)
RETURN p
```

3. Who has access to the storage account `storage-1`?

```
MATCH a = (storage:STORAGEACCOUNT {name: "storage-1"})<-[:CONTAINS]-(rg:RESOURCEGROUP)<-[:CONTAINS]-(sub:SUBSCRIPTION)<-[:CONTAINS]-(mg1:MANAGEMENTGROUP)<-[:CONTAINS]-(mg2:MANAGEMENTGROUP)
OPTIONAL MATCH b = (:AADOBJECT)-[:HASROLE]->(storage)
OPTIONAL MATCH c = (:AADOBJECT)-[:HASROLE]->(rg)
OPTIONAL MATCH d = (:AADOBJECT)-[:HASROLE]->(sub)
OPTIONAL MATCH e = (:AADOBJECT)-[:HASROLE]->(mg1)
OPTIONAL MATCH f = (:AADOBJECT)-[:HASROLE]->(mg2)
RETURN *
```

A more compact version of the query is:

```
MATCH a = (storage:STORAGEACCOUNT)
(()<-[:CONTAINS]-(:RESOURCEGROUP|SUBSCRIPTION|MANAGEMENTGROUP)){0,} // zero or more "CONTAINS" relationships
()<-[:HASROLE]-(:AADOBJECT) // a "HASROLE" relationship to the last matched node
RETURN a
```

or a tabular version is:

```
MATCH a = (storage:STORAGEACCOUNT)
(()<-[:CONTAINS]-(:RESOURCEGROUP|SUBSCRIPTION|MANAGEMENTGROUP)){0,}
()<-[r:HASROLE]-(u:AADOBJECT)
RETURN DISTINCT u.name, r.rolename
```

4. Who has high-privilege access to the Key Vault `kv-1`? We need to unroll any group memberships group for any transitive permissions as well as any direct permissions:

```
MATCH p = (:KEYVAULT)<-[h:HASACCESSPOLICY]-(:AADOBJECT)-[:CONTAINS*0..]->(u:AADOBJECT)
WHERE h.permissions CONTAINS "all"
RETURN p
```

Users with [APOC](https://neo4j.com/labs/apoc/) enabled can access properties of the `permissions` dictionary:

```
MATCH p = (:KEYVAULT)<-[h:HASACCESSPOLICY]-(:AADOBJECT)-[:CONTAINS*0..]->(u:AADOBJECT)
WHERE "all" IN apoc.convert.fromJsonMap(h.permissions).secrets
RETURN p
```

5. Is our VM accessible to the Internet?

```
MATCH p =  (:VIRTUALMACHINE { name : "0" })<-[:ISATTACHEDTO]-(:NETWORKINTERFACE)<-[:PROTECTS]-(:NETWORKSECURITYGROUP)-[:CONTAINS]->(rule:NETWORKSECURITYGROUPRULE)
RETURN p
```

Over which ports?

```
MATCH p =  (:VIRTUALMACHINE { name : "0" })<-[:ISATTACHEDTO]-(:NETWORKINTERFACE)<-[:PROTECTS]-(:NETWORKSECURITYGROUP)-[:CONTAINS]->(rule:NETWORKSECURITYGROUPRULE)
WHERE rule.access = "allow"
RETURN rule.sourceportranges
```

6. If Key Vault `kv-1` is accessed maliciously, what resources are at risk? 

```
MATCH (:KEYVAULT { name: "kv-1"})-[:CONTAINS*]->()-[:AUTHENTICATES]->(resource)
RETURN DISTINCT resource
```

7. Do any Entra objects have the ability to elevate privileges against a Function by compromising a storage account used by that Function?

```
MATCH p = (u:AADOBJECT)-[:HASROLE {rolename: "storage blob data contributor"}]->(s:STORAGEACCOUNT)<-[:USES]-(f:FUNCTIONAPP)
WHERE NOT EXISTS ((u)-[:HASROLE {rolename: "contributor"}]->(f))
OPTIONAL MATCH q = (u)-[:HASROLE]->(f)
RETURN p,q
```

A service principal has permission to write to `storage-1` used by `function-app-1` while only having `Reader` permissions on the Function App itself.
Even more concerning, the service principal is from an external tenant!