# aks-csi-azure-files-inspection

## Overview
creating AKS environment to try Azure files CSI Driver

refs -> https://learn.microsoft.com/ja-jp/azure/aks/azure-csi-files-storage-provision

## steps to provisinoning


1, Initialize terraform for `azure` directory

```
terraform -chdir=azure init
```

2, Deploy Azure resources

```
terraform -chdir=azure apply
```

3, keep the output result 

```
aks_cluster_name = "csi-azurefile"
aks_cluster_resource_group_name = "aks-azurefile-csi-rg-centralus"
azure_resource_group_name_for_helm = "aks-azurefile-csi-rg-centralus"
azure_storage_account_key_for_helm = <sensitive>
azure_storage_account_name_for_helm = "csifilesXXXXXXXXXXXXX"
azurefile_share_name_for_helm = "shareXXXXXXXXXXXXX"
```

Note: For value `azure_storage_account_key_for_helm`, use the command below to get the actual value and replace the `<sensitive>` value with the command result.

```
terraform -chdir=azure output --raw azure_storage_account_key_for_helm
```

4, set cluster context to local `.kube/config` file

```
az aks get-credentials -n { value of 'aks_cluster_name' from step 3 } -g { value of 'aks_cluster_resource_group_name' from step 3 }
```

5, create `helm/terraform.tfvars` file with the output of step 3, as below.

```
azure_resource_group_name_for_helm = "aks-azurefile-csi-rg-centralus"
azure_storage_account_key_for_helm = <sensitive>
azure_storage_account_name_for_helm = "csifiles7379089d0ba3dbe9"
azurefile_share_name_for_helm = "share7379089d0ba3dbe9"
```

6, Initialize terraform for `helm` directory

```
terraform -chdir=helm init
```

7, Deploy Kubernetes resources
```
terraform -chdir=helm apply
```

8, check the pod running on `default` namespace, and confirm if you can retrieve the files uploaded on the azure files from Pods file system [ `/mnt/azure` ]

example command
```
kubectl exec -it demo-app-XXX-XXX -- ls /mnt/azure
```