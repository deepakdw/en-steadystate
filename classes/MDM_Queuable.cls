/*******************************************************//**
@class      MDM_Queuable
@purpose    MDM_Queuable class invoked by schedulable class to trigger the MDM 360 integration process with SFDC.           
@author     Deepak Dwivedi
@date       8/18/2018 3:05 AM
@invokedby  MDM_Schedulable.
***********************************************************/
global without sharing class MDM_Queuable implements Queueable, Database.AllowsCallouts{

  Boolean empty;
  global void execute(QueueableContext qc){
    empty = true;    
    MDM_Config__mdt parm = [select filterCriteria__c, recordsToReturn__c, returnTotal__c from MDM_Config__mdt];
    if(empty){
      MDM_AccountsHelper objAccountsHelper = new MDM_AccountsHelper();           
      objAccountsHelper.calloutSearchQuery(parm.filterCriteria__c, Integer.valueof(parm.recordsToReturn__c), parm.returnTotal__c);       
    }
  }
}