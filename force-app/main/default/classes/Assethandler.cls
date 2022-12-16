public class Assethandler {
    public static void Assethandlerupdate (List<Asset> assTriggerNew, List<Asset> assTriggerold, 
    Map<Id,Asset> assTriggerNewMap, Map<Id,Asset> assTriggerOldMap) {
        for (asset eachAss : assTriggerNew) {
            if (eachAss.Id == null) {
                if (eachAss.Status == 'Shipped') {
                    eachAss.Description = 'Asset is shipped';
                }
                if (eachAss.Status == 'Installed') {
                    eachAss.description= 'Asset is Installed';
                } 
            }else {
                Asset oldaSS = assTriggerOldMap.get(eachAss.Id);
                if (oldAss.Status != 'Shipped') {
                    if (eachAss.Status == 'Shipped') {
                        eachAss.Description = 'Asset is shipped';
                    }
                    if (eachAss.Status == 'Installed') {
                        eachAss.description= 'Asset is Installed';
                    }
                }
                if (eachAss.Status != 'Shipped' || eachAss.Status != 'Installed' ) {
                    eachAss.Description = '';
                }
            }
            }
           
    }
}


