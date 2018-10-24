@isTest
private class MDM_AccountsHelperTest{ 
   
    static Account acc;    
    static void create_AccountData() {
        acc = new Account();
        acc.Name = 'Test';
        acc.RecordTypeId = Schema.Sobjecttype.Account.getRecordTypeInfosByDeveloperName().get('End_User').getRecordTypeId();
        acc.Geography__c = 'TBD';
        acc.Region__c = 'TBD';
        acc.Federal_Category__c = 'TBD';
        acc.Phone = '';
        acc.Website = '';
        acc.DUNSNumber__c = '';
        acc.Partner_Status__c = '';
        acc.C360_Party_Name__c = '';
        acc.BillingStreet = '';
        acc.BillingCity = '';
        acc.BillingState = '';
        acc.BillingCountry = '';
        acc.BillingPostalCode = '';
        insert acc;
    }
    
    @isTest static void calloutSearchQueryTest(){

        create_AccountData(); 
        Test.startTest();
            MDM_AccountsHelper objMDM_AccountsHelper = new MDM_AccountsHelper();
            objMDM_AccountsHelper.set_AllAccountIds.add(acc.Id);
            objMDM_AccountsHelper.set_thisAccountIds.add(acc.Id);
            MDM_AccountsHelper.BOGoldenRecord_Wrapper objBOGoldenRecord_Wrapper = new MDM_AccountsHelper.BOGoldenRecord_Wrapper();
            objBOGoldenRecord_Wrapper.rowId = '40488';               
            objBOGoldenRecord_Wrapper.acctName = 'test';            
            objBOGoldenRecord_Wrapper.phone = '1234567899';               
            objBOGoldenRecord_Wrapper.DUNSNumber = '1411';          
            objBOGoldenRecord_Wrapper.Website = 'abc';             
            objBOGoldenRecord_Wrapper.Partner_Status = '1';      
            objBOGoldenRecord_Wrapper.Partner_Level = '1';         
            objBOGoldenRecord_Wrapper.RecordTypeId = Schema.Sobjecttype.Account.getRecordTypeInfosByDeveloperName().get('End_User').getRecordTypeId();          
            objBOGoldenRecord_Wrapper.AddressType = 'a';         
            objBOGoldenRecord_Wrapper.BillingCountry = 'US';
            objBOGoldenRecord_Wrapper.BillingState = 'New York';
            objBOGoldenRecord_Wrapper.BillingCity = 'New York';
            objBOGoldenRecord_Wrapper.BillingPostalCode = '12345';
            objBOGoldenRecord_Wrapper.BillingStreet = 'S';
            objBOGoldenRecord_Wrapper.BillingADDR_LN_1 = 'L1';
            objBOGoldenRecord_Wrapper.BillingADDR_LN_2 = 'l2';
            objBOGoldenRecord_Wrapper.BillingCountryCode = '1';
            objMDM_AccountsHelper.list_BOGR_wrap.add(objBOGoldenRecord_Wrapper);
            for(MDM_AccountsHelper.BOGoldenRecord_Wrapper boGRW : objMDM_AccountsHelper.list_BOGR_wrap) {
                boGRW.BillingCountryCode = '1'; 
                boGRW.BillingCity = 'New York';
                boGRW.BillingPostalCode = '12345';          
                boGRW.Website = '1234567899';        
                boGRW.DUNSNumber = '1234';
            }
            Test.setMock(WebServiceMock.class, new MDM_SiperianServiceWebServiceMock()); 
            objMDM_AccountsHelper.calloutSearchQuery('ADDR_TYP=\'Billing\' AND LAST_UPDATE_DATE >= SYSDATE - 30', 1, true);        
        Test.stopTest();
    }

    @isTest static void calloutSearchQueryInsertTest(){

        create_AccountData();        
        Test.startTest();
            MDM_AccountsHelper objMDM_AccountsHelper = new MDM_AccountsHelper();
            objMDM_AccountsHelper.set_AllAccountIds.add(null);
            objMDM_AccountsHelper.set_thisAccountIds.add(null);
            MDM_AccountsHelper.BOGoldenRecord_Wrapper objBOGoldenRecord_Wrapper = new MDM_AccountsHelper.BOGoldenRecord_Wrapper();
            objBOGoldenRecord_Wrapper.rowId = '40488';               
            objBOGoldenRecord_Wrapper.acctName = 'test';            
            objBOGoldenRecord_Wrapper.phone = '1234567899';               
            objBOGoldenRecord_Wrapper.DUNSNumber = '1411';          
            objBOGoldenRecord_Wrapper.Website = 'abc';             
            objBOGoldenRecord_Wrapper.Partner_Status = '1';      
            objBOGoldenRecord_Wrapper.Partner_Level = '1';         
            objBOGoldenRecord_Wrapper.RecordTypeId = Schema.Sobjecttype.Account.getRecordTypeInfosByDeveloperName().get('End_User').getRecordTypeId();          
            objBOGoldenRecord_Wrapper.AddressType = 'a';         
            objBOGoldenRecord_Wrapper.BillingCountry = 'US';
            objBOGoldenRecord_Wrapper.BillingState = 'New York';
            objBOGoldenRecord_Wrapper.BillingCity = 'New York';
            objBOGoldenRecord_Wrapper.BillingPostalCode = '12345';
            objBOGoldenRecord_Wrapper.BillingStreet = 'S';
            objBOGoldenRecord_Wrapper.BillingADDR_LN_1 = 'L1';
            objBOGoldenRecord_Wrapper.BillingADDR_LN_2 = 'l2';
            objBOGoldenRecord_Wrapper.BillingCountryCode = '1';
            objMDM_AccountsHelper.list_BOGR_wrap.add(objBOGoldenRecord_Wrapper);
            for(MDM_AccountsHelper.BOGoldenRecord_Wrapper boGRW : objMDM_AccountsHelper.list_BOGR_wrap) {
                boGRW.BillingCountryCode = '1'; 
                boGRW.BillingCity = 'New York';
                boGRW.BillingPostalCode = '12345';          
                boGRW.Website = '1234567899';        
                boGRW.DUNSNumber = '1234';
            }
            Test.setMock(WebServiceMock.class, new MDM_SiperianServiceWebServiceMock()); 
            objMDM_AccountsHelper.calloutSearchQuery('ADDR_TYP=\'Billing\' AND LAST_UPDATE_DATE >= SYSDATE - 30', 1, true);        
        Test.stopTest();
    }
}