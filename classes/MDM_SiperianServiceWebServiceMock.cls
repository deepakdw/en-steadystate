@isTest
global class MDM_SiperianServiceWebServiceMock implements WebServiceMock {
    global void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType) {
            MDM_SiperianService.SearchQueryResponse responseSQR = new MDM_SiperianService.SearchQueryResponse();
            MDM_SiperianService.Field objField = new MDM_SiperianService.Field();
            //objField.name = 'test';
            objField.name = 'ROWID_OBJECT';
            objField.stringValue = '1'; 
            objField.bigIntegerValue = '1';
            objField.bigDecimalValue = '1';
            objField.dateValue = datetime.now();
            system.debug('objField ##' +objField);
            List<MDM_SiperianService.Field> listField = new List<MDM_SiperianService.Field>();  
            listField.add(objField);    
            MDM_SiperianService.Record objRecord = new MDM_SiperianService.Record();
            objRecord.field = listField;
            objRecord.siperianObjectUid = 'test';
            List<MDM_SiperianService.Record> listRecord = new List<MDM_SiperianService.Record>();
            listRecord.add(objRecord);
            MDM_SiperianService.Parameter objParameter = new MDM_SiperianService.Parameter();
            objParameter.stringValue = 'test';
            objParameter.dateValue = datetime.now();
            objParameter.booleanValue = true;
            List<MDM_SiperianService.Parameter> listParameter = new List<MDM_SiperianService.Parameter>();
            listParameter.add(objParameter);
               
            responseSQR.message = 'Test';
            responseSQR.interactionId = '123';
            responseSQR.record = listRecord;
            responseSQR.filterParameter = listParameter;
            responseSQR.recordCount = '1';
            responseSQR.searchToken = 'test';
            //response.put('response_x', responseSQR); 
   }
}