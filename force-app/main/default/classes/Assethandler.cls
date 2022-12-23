public class Assethandler {
    public static void Assethandlerupdate (List<Asset> assTriggerNew, List<Asset> assTriggerold, 
    Map<Id,Asset> assTriggerNewMap, Map<Id,Asset> assTriggerOldMap) {
        if (assTriggerNewMap != null) {
            set<id> assetIdSet = assTriggerNewMap.keySet();
            for (Id assetId : assetIdSet) {
                if (assTriggerNewMap.get(assetId).Status != assTriggerOldMap.get(assetId).Status && assTriggerNewMap.get(assetId).Status == 'Shipped' ) {
                    assTriggerNewMap.get(assetId).Description = 'Asset is shipped';
                }
                if (assTriggerNewMap.get(assetId).Status != assTriggerOldMap.get(assetId).Status && assTriggerNewMap.get(assetId).Status == 'Installed' ) {
                    assTriggerNewMap.get(assetId).Description = 'Asset is installed';
                    
                }
            }
        }else {
            for (Asset eachAsset : assTriggerNew) {
                if (eachAsset.Status =='Shipped') {
                    eachAsset.Description = 'Asset is shipped';
                }else if (eachAsset.Status =='Installed') {
                    eachAsset.Description = 'Asset is installed';
                }
            }
        }
       
           
    }
}


