@isTest

private class MDM_SiperianServiceTest {
    
    @isTest static void testMethod1() { 
        
        Test.startTest();
        MDM_SiperianService objMDM_SiperianService = new MDM_SiperianService();
        MDM_SiperianService.SiperianRequest objSR = new MDM_SiperianService.SiperianRequest();
        MDM_SiperianService.Field objField = new MDM_SiperianService.Field();
        MDM_SiperianService.Record objRecord = new MDM_SiperianService.Record();
        MDM_SiperianService.SiperianResponse objSiperianResponse = new MDM_SiperianService.SiperianResponse();
        MDM_SiperianService.Password objPassword = new MDM_SiperianService.Password();
        MDM_SiperianService.Parameter objParameter = new MDM_SiperianService.Parameter();
        MDM_SiperianService.SearchQueryRequest objSearchQueryRequest = new MDM_SiperianService.SearchQueryRequest();
        MDM_SiperianService.SearchQueryResponse objSearchQueryResponse = new MDM_SiperianService.SearchQueryResponse();
        MDM_SiperianService.RecordKey objRecordKey = new MDM_SiperianService.RecordKey();
        objRecordKey.rowid = '131582';
        MDM_SiperianService.RecordTypes objRecordTypes = new MDM_SiperianService.RecordTypes();
        objRecordTypes.xref = true;
        MDM_SiperianService.GetRequest objGetRequest = new MDM_SiperianService.GetRequest();
        MDM_SiperianService.GetResponse objGetResponse = new MDM_SiperianService.GetResponse();
        MDM_SiperianService.Soap objSoap = new MDM_SiperianService.Soap();
        MDM_GetFieldWrapper objGFW = new MDM_GetFieldWrapper();
        objGFW.setField('test','test');
        objGFW.getField('test');
        objGFW.deepClone();
        List<MDM_GetFieldWrapper> listGFW = new List<MDM_GetFieldWrapper>();
        listGFW.add(objGFW);
        MDM_GetRecordWrapper objGetRecordWrapper = new MDM_GetRecordWrapper();
        objGetRecordWrapper.setField('test','test');
        objGetRecordWrapper.getField('test');
        objGetRecordWrapper.field = listGFW;
        objGetRecordWrapper.deepClone();
        List<MDM_GetRecordWrapper> listGRW = new List<MDM_GetRecordWrapper>();
        listGRW.add(objGetRecordWrapper);
        MDM_GetResponseWrapper objGRW = new MDM_GetResponseWrapper();
        objGRW.setField('test','test');
        objGRW.getField('test');
        objGRW.record = listGRW;
        objGRW.deepClone();
        MDM_SearchQueryFieldWrapper objSQFW = new MDM_SearchQueryFieldWrapper();
        objSQFW.setField('test','test');
        objSQFW.getField('test');
        objSQFW.deepClone();
        List<MDM_SearchQueryFieldWrapper> listSQFW = new List<MDM_SearchQueryFieldWrapper>();
        listSQFW.add(objSQFW);
        MDM_SearchQueryRecordWrapper objSQRW = new MDM_SearchQueryRecordWrapper();
        objSQRW.siperianObjectUid = '123';
        objSQRW.setField('test','test');
        objSQRW.getField('test');
        objSQRW.field = listSQFW;
        objSQRW.deepClone();
        List<MDM_SearchQueryRecordWrapper> listSQRW = new List<MDM_SearchQueryRecordWrapper>();
        listSQRW.add(objSQRW);
        MDM_SearchQueryWrapper objSQW = new MDM_SearchQueryWrapper();
        objSQW.setField('test','test');
        objSQW.getField('test');
        objSQW.record = listSQRW;
        objSQW.deepClone();
        objSQW.getIntegerValue('1');
        objSQW.getIntegerValue(1);
        objSQW.getIntegerValue(1.11);
        objSQW.getDecimalValue('1');
        objSQW.getDecimalValue(123456789);
        objSQW.getDecimalValue(1.1111);
        objSQW.getDateValue('2018-01-01');
        objSQW.getDateValue(Date.newInstance(1960, 2, 17));
        objSQW.getBooleanValue('1');        
        objSQW.getBooleanValue(true);
        objSQW.getStringValue(1);
        Test.setMock(WebServiceMock.class, new MDM_SiperianServiceWebServiceMock()); 
        objSQW = objSoap.searchQuery('test', 1, true);
        
        objGRW = objSoap.get(objRecordKey, objRecordTypes);
        system.debug('objSQW======='+objSQW);
        Test.stopTest();
    }
}