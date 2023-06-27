## Manager Resource Drift
- Replace
```bash
terraform apply -replace="azurerm_virtual_network.example"
```
- Import
```bash
terraform import azurerm_virtual_network.example-2 /subscriptions/362c098f-1ff6-4263-850f-a8bd7358325f/resourceGroups/myTFResourceGroup/providers/Microsoft.Network/virtualNetworks/example-network-2
```
- Refresh
```bash
terraform apply -refresh-only
```