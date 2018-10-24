/*******************************************************//**
@@@@@ This is a combined class for both callouts and dml operations. This class uses the methods of the MDM_SiperianService class.
@@@@@ Methods of this class are initiated by Queueable.
@class      MDM_AccountsHelper
@brief      Match scenarios between Accounts(Golden records) from MDM Informatica (Siperian API) and SFDC.
@author     Deepak Dwivedi 
@bug        No known defects.
@todo       None.
***********************************************************/

public with sharing class MDM_AccountsHelper{    
    
    //Variables
    public MDM_SiperianService.RecordKey recordKey;
    public MDM_SiperianService.RecordTypes recordTypes;
    public List<MDM_SearchQueryRecordWrapper> recordList {get;set;}
    public List<MDM_GetRecordWrapper> getRecordList {get;set;}
    public List<BOGoldenRecord_Wrapper> list_BOGR_wrap = new List<BOGoldenRecord_Wrapper>();    
    List<Account> listMatchedAccounts = new List<Account>();
    List<Account> listNewAccounts = new List<Account>();
    
    Map<String, Set<Account>> mapMatchedAccounts = new Map<String, Set<Account>>();
    Map<String, Set<Id>> map_RowID_AccountIds = new Map<String, Set<Id>>();    
    Map<String,Account> map_FinalAccounts = new Map<String,Account>();    
    public Set<Id> set_AllAccountIds = new Set<Id>();    
    public Set<Id> set_thisAccountIds = new Set<Id>();  
    Set<Id> setFinal = new Set<Id>();
    Id accOwner = null;
    
    //Constructor
    public MDM_AccountsHelper(){
        recordKey =  new MDM_SiperianService.RecordKey();
        recordTypes = new MDM_SiperianService.RecordTypes(); 
        accOwner = [SELECT Id FROM User WHERE CommunityNickname='datahold'].Id;
    }
    
    //Wrapper for BO golden file
    public class BOGoldenRecord_Wrapper{
        public String rowId;               
        public String acctName;            
        public String phone;               
        public String DUNSNumber;          
        public String Website;             
        public String Partner_Status;      
        public String Partner_Level;         
        public String RecordTypeId;              
        public String AddressType;         
        public String BillingCountry;
        public String BillingState;
        public String BillingCity;
        public String BillingPostalCode;
        public String BillingStreet;
        public String BillingADDR_LN_1;
        public String BillingADDR_LN_2;
        public String BillingCountryCode;
    }
    
    //Below method has the logic to make serachQuery callout and store the response in BO Wrapper
    public void calloutSearchQuery(String filterCriteria, Integer recordsToReturn, Boolean returnTotal){
        
        MDM_SiperianService.Soap sApi = new MDM_SiperianService.Soap();        
        MDM_SearchQueryWrapper calloutResponseSearch = sApi.SearchQuery(filterCriteria, recordsToReturn, returnTotal);        
        if(calloutResponseSearch != null){
            recordList = calloutResponseSearch.record;
            if(recordList != null && recordList.size() > 0){
                for(MDM_SearchQueryRecordWrapper rec : recordList){                    
                    BOGoldenRecord_Wrapper BOGR_wrap = new BOGoldenRecord_Wrapper();
                    List<MDM_SearchQueryFieldWrapper> fieldList = rec.field;
                    
                    for(MDM_SearchQueryFieldWrapper att : fieldList){                        
                        if(att.name == 'ROWID_OBJECT' && att.stringValue != '' && att.stringValue != null){
                            BOGR_wrap.rowId = att.stringValue.trim();
                        }
                        if(att.name == 'FULL_NM' && att.stringValue != '' && att.stringValue != null){
                            BOGR_wrap.acctName = att.stringValue.trim();
                        }                        
                        if(att.name == 'PHN_NUM' && att.stringValue != '' && att.stringValue != null){
                            BOGR_wrap.phone = att.stringValue.trim();
                        }
                        if(att.name == 'DUNS_NUMBER' && att.stringValue != '' && att.stringValue != null){
                            BOGR_wrap.DUNSNumber = att.stringValue.trim();
                        }
                        if(att.name == 'WEBSITE' && att.stringValue != '' && att.stringValue != null){
                            BOGR_wrap.Website = att.stringValue.trim();
                        }
                        if(att.name == 'PARTY_STATUS' && att.stringValue != '' && att.stringValue != null){
                            BOGR_wrap.Partner_Status = att.stringValue.trim();
                        }
                        if(att.name == 'RCRD_TYP' && att.stringValue != '' && att.stringValue != null){
                            if(att.stringValue.trim().toLowerCase() == 'partner'){ 
                                BOGR_wrap.RecordTypeId = Schema.Sobjecttype.Account.getRecordTypeInfosByDeveloperName().get('Partner').getRecordTypeId();                                
                            }else if(att.stringValue.trim().toLowerCase() == 'end user'){                                            
                                BOGR_wrap.RecordTypeId = Schema.Sobjecttype.Account.getRecordTypeInfosByDeveloperName().get('End_User').getRecordTypeId();                                
                            }
                        }
                        if(att.name == 'ADDR_TYP' && att.stringValue != '' && att.stringValue != null){
                            BOGR_wrap.AddressType = att.stringValue.trim();
                        }
                        if(att.name == 'CNTRY_DESC' && att.stringValue != '' && att.stringValue != null){
                            BOGR_wrap.BillingCountry = att.stringValue.trim();
                        }
                        if(att.name == 'CNTRY_CD' && att.stringValue != '' && att.stringValue != null){
                            BOGR_wrap.BillingCountryCode = att.stringValue.trim();
                        }
                        if(att.name == 'STATE' && att.stringValue != '' && att.stringValue != null){
                            BOGR_wrap.BillingState = att.stringValue.trim();
                        }
                        if(att.name == 'CITY' && att.stringValue != '' && att.stringValue != null){
                            BOGR_wrap.BillingCity = att.stringValue.trim();
                        }
                        if(att.name == 'PSTL_CD' && att.stringValue != '' && att.stringValue != null){
                            BOGR_wrap.BillingPostalCode = att.stringValue.trim();
                        }
                        if(att.name == 'ADDR_LN_1' && att.stringValue != '' && att.stringValue != null){
                            BOGR_wrap.BillingADDR_LN_1 = att.stringValue.trim();
                        }
                        if(att.name == 'ADDR_LN_2' && att.stringValue != '' && att.stringValue != null){
                            BOGR_wrap.BillingADDR_LN_2 = att.stringValue.trim();
                        }                        
                    }
                    
                    if(BOGR_wrap.BillingADDR_LN_2 == null)
                        BOGR_wrap.BillingADDR_LN_2 = '';
                    BOGR_wrap.BillingStreet = BOGR_wrap.BillingADDR_LN_1 + BOGR_wrap.BillingADDR_LN_2;
                    
                    if(BOGR_wrap.AddressType.trim().toLowerCase() == 'billing'){
                        if(BOGR_wrap.rowId != null ||  BOGR_wrap.rowId != '' || BOGR_wrap.acctName != null ||  BOGR_wrap.acctName != ''){                            
                            list_BOGR_wrap.add(BOGR_wrap);
                        }
                    }
                }
            }
        } 
        if(list_BOGR_wrap.size() > 0){
            processAccountsMatching();
        }
    }    
    
    //Below method has the logic for making callout to get response from Xref and match Salesforce account  
    public void processAccountsMatching(){        
        String prevRowId = '';        
        for(BOGoldenRecord_Wrapper bogr : list_BOGR_wrap){  
            //To Save Accountids related to this rowid into a set.
            set_thisAccountIds = new Set<Id>();
            
            recordKey.rowid = bogr.rowId.trim();
            recordTypes.xref = true;
            
            MDM_GetResponseWrapper calloutResponseGet;
            if(recordKey.rowid != prevRowId){
                MDM_SiperianService.Soap sApi = new MDM_SiperianService.Soap();
                calloutResponseGet = sApi.get(recordKey, recordTypes);                
            }
            if(calloutResponseGet != null){
                getRecordList = calloutResponseGet.record;
                if(getRecordList != null && getRecordList.size() > 0){
                    for(MDM_GetRecordWrapper rec : getRecordList){
                        List<MDM_GetFieldWrapper> fieldList = rec.field;
                        for(MDM_GetFieldWrapper xref_Field : fieldList){
                            if(xref_Field.name == 'PKEY_SRC_OBJECT' && xref_Field.stringValue != null  && xref_Field.stringValue != ''){
                                if((xref_Field.stringValue.trim().length() == 15 || xref_Field.stringValue.trim().length() == 18) && xref_Field.stringValue.trim().left(3) == '001'){
                                    System.debug('SFDC ID found:'+ xref_Field.stringValue.trim() + 'For rowid:' + bogr.rowId.trim());
                                    //set_AllAccountIds.add(xref_Field.stringValue.trim()); // Commented for testing, To be removed in real scenario.
                                    //set_thisAccountIds.add(xref_Field.stringValue.trim());
                                }
                            }
                        }
                    }
                }
            }
            //Testing data, To be removed in real scenario.         
            if(bogr.rowId == '131582'){
                Boolean result1 = set_thisAccountIds.addAll(set_AllAccountIds);
                //set_AllAccountIds.add('0011b00000X6o4yAAB');
                //set_thisAccountIds.add('0011b00000X6o4yAAB');
            }  
            if(bogr.rowId == '40488'){
                Boolean result1 = set_thisAccountIds.addAll(set_AllAccountIds);
                //set_AllAccountIds.add('0011b00000XvRwHAAV');
                //set_thisAccountIds.add('0011b00000XvRwHAAV');                
            }                   
            
            //Testing Data End, To be removed in real scenario.
            if(set_thisAccountIds.size() > 0){
                map_RowID_AccountIds.put(bogr.rowId, set_thisAccountIds); 
            }            
        }
        //Query to get the Accounts from Salesforce where accountId is returned from get callout
        Map<Id, Account> m_Id_Account = new Map<Id, Account>([SELECT Id, Name, Phone, Website, C360_Party_Name__c, BillingCity, BillingCountry, BillingPostalCode, 
                                                              BillingState, BillingStreet, DUNSNumber__c, RecordTypeId 
                                                              FROM Account
                                                              WHERE Id IN: set_AllAccountIds]);
        
        if(map_RowID_AccountIds.size() > 0){
            for(String rowid : map_RowID_AccountIds.keySet()){            
                Set<Account> tempSetAccount;            
                for(Id acctId : map_RowID_AccountIds.get(rowid)){                      
                    if(acctId != null){
                        if(mapMatchedAccounts.containsKey(rowid)){
                            tempSetAccount = mapMatchedAccounts.get(rowid);
                        }else{
                            tempSetAccount = new Set<Account>();
                        }
                        tempSetAccount.add(m_Id_Account.get(acctId));
                        mapMatchedAccounts.put(rowid, tempSetAccount);                        
                    }
                }                      
            }
        }
        
        //**Business logic, make comparison for every BOGoldenRecord
        Map<String, Account> map_FinalAccountsTo_Insert = new Map<String, Account>();
        for(BOGoldenRecord_Wrapper bogr : list_BOGR_wrap){     
            //Remove all nulls
            if(bogr.Partner_Level == null){bogr.Partner_Level = '';}
            if(bogr.BillingStreet == null){bogr.BillingStreet = '';}
            if(bogr.DUNSNumber == null){bogr.DUNSNumber = '';}
            if(bogr.phone == null){bogr.phone = '';}
            if(bogr.Website == null){bogr.Website = '';}
            if(bogr.Partner_Status == null){bogr.Partner_Status = '';}
            if(bogr.RecordTypeId == null){
                //If Record Type is NULL in the MDM Response, marking recordtype as default to end user.
                bogr.RecordTypeId = Schema.Sobjecttype.Account.getRecordTypeInfosByDeveloperName().get('End_User').getRecordTypeId();
            }
                        
            if(mapMatchedAccounts.get(bogr.rowId) != Null){
                for(Account acct : mapMatchedAccounts.get(bogr.rowId)){                    
                    if(acct != null){ // Condition for Account update
                        if(bogr.BillingCountryCode != null && bogr.BillingCity != null && bogr.BillingPostalCode != null){
                            acct.C360_Party_Name__c = bogr.acctName;
                            if(bogr.Phone != ''){acct.Phone = bogr.phone;}                        
                            if(bogr.Website != ''){acct.Website = bogr.Website;}
                            if(bogr.DUNSNumber != ''){acct.DUNSNumber__c = bogr.DUNSNumber;}
                            if(bogr.Partner_Status != ''){acct.Partner_Status__c = bogr.Partner_Status;}                        
                            acct.BillingStreet = bogr.BillingStreet;
                            acct.BillingCity = bogr.BillingCity;
                            acct.BillingState = bogr.BillingState;
                            acct.BillingCountry = bogr.BillingCountry;
                            acct.BillingPostalCode = bogr.BillingPostalCode;       
                            
                            map_FinalAccounts.put(bogr.rowId, acct);  //Create update account map.
                        }          
                    }
                } 
            }
            else{ //Condition for Account insert                
                Account accountToInsert;                
                if(bogr.BillingStreet != null && bogr.BillingCity != null && bogr.BillingState != null 
                   && bogr.BillingCountry != null && bogr.BillingPostalCode != null){ 
                       
                    accountToInsert = new Account(Name = bogr.acctName,
                                                  RecordTypeId = bogr.RecordTypeId,                                                  
                                                  OwnerId = accOwner,
                                                  Geography__c = 'TBD',
                                                  Region__c = 'TBD',
                                                  Federal_Category__c = 'TBD',
                                                  Phone = bogr.phone,
                                                  Website = bogr.Website,
                                                  DUNSNumber__c = bogr.DUNSNumber,
                                                  Partner_Status__c = bogr.Partner_Status,
                                                  C360_Party_Name__c = bogr.acctName,
                                                  BillingStreet = bogr.BillingStreet,
                                                  BillingCity = bogr.BillingCity,
                                                  BillingState = bogr.BillingState,
                                                  BillingCountry = bogr.BillingCountry,
                                                  BillingPostalCode = bogr.BillingPostalCode);
                }
                map_FinalAccountsTo_Insert.put(bogr.rowId, accountToInsert);                
            }
        }
        
        Map<String, Account> mapAll = new Map<String, Account>();               
        try{ //DML operation on Account object 
            List<Account> lst_Upsert = new List<Account>();
            if(map_FinalAccounts.size() > 0){
                mapAll.putall(map_FinalAccounts.values());
            }
            lst_Upsert.addAll(mapAll.values());
            if(map_FinalAccountsTo_Insert.size() > 0)                 
                lst_Upsert.addAll(map_FinalAccountsTo_Insert.values());

            upsert lst_Upsert;           
            
        }catch(DmlException e){
            System.debug('Upsert Failed in Process Accounts Matching #: ' + e.getMessage());  
        }        
    }        
}