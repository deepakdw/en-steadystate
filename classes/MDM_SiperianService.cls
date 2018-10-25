/*******************************************************//**
@class      MDM_SiperianService
@purpose    Siperian Service class for making callouts to MDM 360 service.
@author     Deepak Dwivedi
@Date       8/9/2018 3:19 AM
@invokedby  MDM_AccountsHelper
***********************************************************/
public class MDM_SiperianService{    
    
    public String usrName, passwd, orsIds, siperianObjectUid_search, siperianObjectUid_get; 
    public MDM_SiperianService(){                
        MDM_Config__mdt mdmConfig = [select orsId__c, siperianObjectUid_search__c, siperianObjectUid_get__c from MDM_Config__mdt];                
        usrName = '{!$Credential.Username}';
        passwd = '{!$Credential.Password}';
        orsIds = mdmConfig.orsId__c;
        siperianObjectUid_search = mdmConfig.siperianObjectUid_search__c;
        siperianObjectUid_get = mdmConfig.siperianObjectUid_get__c;    
    }

    public virtual class SiperianRequest{  
    
        MDM_SiperianService mdm = new MDM_SiperianService();        
        public String username = mdm.usrName;
        public String securityPayload;        
        public String orsId = mdm.orsIds;
        public String interactionId;
        public Boolean disablePaging = false;        
        private String[] username_type_info = new String[]{'username','urn:siperian.api',null,'0','1','true'};        
        private String[] securityPayload_type_info = new String[]{'securityPayload','urn:siperian.api',null,'0','1','true'};
        private String[] orsId_type_info = new String[]{'orsId','urn:siperian.api',null,'0','1','true'};
        private String[] disablePaging_type_info = new String[]{'disablePaging','urn:siperian.api',null,'0','1','true'};
        private String[] interactionId_type_info = new String[]{'interactionId','urn:siperian.api',null,'0','1','true'};        
        private String[] apex_schema_type_info = new String[]{'urn:siperian.api','true','false'};        
        private String[] field_order_type_info = new String[]{'username','password','securityPayload','orsId','disablePaging','interactionId'};
    }

    public class Field{

        public String name, stringValue, bigIntegerValue, bigDecimalValue;      
        public DateTime dateValue;        
        private String[] name_type_info = new String[]{'name','urn:siperian.api',null,'1','1','false'};
        private String[] stringValue_type_info = new String[]{'stringValue','urn:siperian.api',null,'1','1','false'};
        private String[] dateValue_type_info = new String[]{'dateValue','urn:siperian.api',null,'1','1','false'};
        private String[] bigIntegerValue_type_info = new String[]{'bigIntegerValue','urn:siperian.api',null,'1','1','false'};
        private String[] bigDecimalValue_type_info = new String[]{'bigDecimalValue','urn:siperian.api',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:siperian.api','true','false'};
        private String[] field_order_type_info = new String[]{'name','stringValue','dateValue','bigIntegerValue','bigDecimalValue'};
    }

    public class Record{

        public MDM_SiperianService.Field[] field;        
        public String siperianObjectUid; 
        private String[] field_type_info = new String[]{'field','urn:siperian.api',null,'1','1','false'};        
        private String[] siperianObjectUid_type_info = new String[]{'siperianObjectUid','urn:siperian.api',null,'1','1','false'}; 
        private String[] apex_schema_type_info = new String[]{'urn:siperian.api','true','false'};
        private String[] field_order_type_info = new String[]{'field','siperianObjectUid'};
    }

    public class SiperianResponse{

        public String message, interactionId;        
        private String[] message_type_info = new String[]{'message','urn:siperian.api',null,'0','1','false'};
        private String[] interactionId_type_info = new String[]{'interactionId','urn:siperian.api',null,'0','1','true'};        
        private String[] apex_schema_type_info = new String[]{'urn:siperian.api','true','false'};
        private String[] field_order_type_info = new String[]{'message','interactionId'};
    }

    public virtual class Password{
        
        MDM_SiperianService mdm = new MDM_SiperianService();        
        public String password = mdm.passwd;
        public Boolean encrypted = false;
        private String[] password_type_info = new String[]{'password','urn:siperian.api',null,'1','1','false'};
        private String[] encrypted_type_info = new String[]{'encrypted','urn:siperian.api',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:siperian.api','true','false'};
        private String[] field_order_type_info = new String[]{'password','encrypted'};
    }

    public class Parameter{

        public String stringValue;        
        public DateTime dateValue;
        public Boolean booleanValue;
        private String[] stringValue_type_info = new String[]{'stringValue','urn:siperian.api',null,'1','1','false'};        
        private String[] dateValue_type_info = new String[]{'dateValue','urn:siperian.api',null,'1','1','false'};
        private String[] booleanValue_type_info = new String[]{'booleanValue','urn:siperian.api',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:siperian.api','true','false'};        
        private String[] field_order_type_info = new String[]{'stringValue','dateValue','booleanValue'};
    }

    public class SearchQueryRequest{

        MDM_SiperianService mdm = new MDM_SiperianService();
        MDM_SiperianService.SiperianRequest sr = new MDM_SiperianService.SiperianRequest(); 
        public String username = sr.username;
        MDM_SiperianService.Password Password = new MDM_SiperianService.Password();
        public String orsId = sr.orsId;
        public Boolean disablePaging = sr.disablePaging;
        private String[] username_type_info = new String[]{'username','urn:siperian.api',null,'0','1','true'};
        private String[] Password_type_info = new String[]{'Password','urn:siperian.api',null,'0','1','true'};
        private String[] orsId_type_info = new String[]{'orsId','urn:siperian.api',null,'0','1','true'};
        private String[] disablePaging_type_info = new String[]{'disablePaging','urn:siperian.api',null,'0','1','true'};
        public String filterCriteria;        
        public String siperianObjectUid = mdm.siperianObjectUid_search;
        public Integer recordsToReturn;
        public Boolean returnTotal;         
        private String[] filterCriteria_type_info = new String[]{'filterCriteria','urn:siperian.api',null,'1','1','false'};
        private String[] siperianObjectUid_type_info = new String[]{'siperianObjectUid','urn:siperian.api',null,'1','1','false'};
        private String[] recordsToReturn_type_info = new String[]{'recordsToReturn','urn:siperian.api',null,'1','1','false'};
        private String[] returnTotal_type_info = new String[]{'returnTotal','urn:siperian.api',null,'1','1','false'};        
        private String[] apex_schema_type_info = new String[]{'urn:siperian.api','true','false'};        
        private String[] field_order_type_info = new String[]{'username','Password','orsId','siperianObjectUid','recordsToReturn','returnTotal','disablePaging','filterCriteria'};        
    }
    
    public class SearchQueryResponse{

        public String message;
        public String interactionId;
        public MDM_SiperianService.Record[] record;
        public MDM_SiperianService.Parameter[] filterParameter;
        public String recordCount;
        public String searchToken;
        private String[] message_type_info = new String[]{'message','urn:siperian.api',null,'0','1','false'};
        private String[] interactionId_type_info = new String[]{'interactionId','urn:siperian.api',null,'0','1','true'};
        private String[] record_type_info = new String[]{'record','urn:siperian.api',null,'1','1','false'};
        private String[] filterParameter_type_info = new String[]{'filterParameter','urn:siperian.api',null,'0','1','false'};
        private String[] recordCount_type_info = new String[]{'recordCount','urn:siperian.api',null,'0','1','false'};
        private String[] searchToken_type_info = new String[]{'searchToken','urn:siperian.api',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'urn:siperian.api','true','false'};
        private String[] field_order_type_info = new String[]{'message','interactionId','record', 'filterParameter','recordCount','searchToken'};
    }    
        
    public class RecordKey {
            
        public String rowid;            
        private String[] rowid_type_info = new String[]{'rowid','urn:siperian.api',null,'0','1','true'};           
        private String[] apex_schema_type_info = new String[]{'urn:siperian.api','true','false'};            
        private String[] field_order_type_info = new String[]{'rowid'};
    }
    
    public class RecordTypes {
            
        public Boolean xref;            
        private String[] xref_type_info = new String[]{'xref','urn:siperian.api',null,'0','1','true'};            
        private String[] apex_schema_type_info = new String[]{'urn:siperian.api','true','false'};            
        private String[] field_order_type_info = new String[]{'xref'};
    }
    
    public class GetRequest{
        
        MDM_SiperianService mdm = new MDM_SiperianService();
        MDM_SiperianService.SiperianRequest sr = new MDM_SiperianService.SiperianRequest(); 
        public String username = sr.username;
        MDM_SiperianService.Password Password = new MDM_SiperianService.Password();
        public String orsId = sr.orsId;        
        public String siperianObjectUid = mdm.siperianObjectUid_get;        
        public MDM_SiperianService.RecordKey recordKey;            
        public MDM_SiperianService.RecordTypes recordTypes;  
        private String[] username_type_info = new String[]{'username','urn:siperian.api',null,'0','1','true'};
        private String[] Password_type_info = new String[]{'Password','urn:siperian.api',null,'0','1','true'};
        private String[] orsId_type_info = new String[]{'orsId','urn:siperian.api',null,'0','1','true'};
        private String[] siperianObjectUid_type_info = new String[]{'siperianObjectUid','urn:siperian.api',null,'1','1','false'};            
        private String[] recordKey_type_info = new String[]{'recordKey','urn:siperian.api',null,'1','1','true'};            
        private String[] recordTypes_type_info = new String[]{'recordTypes','urn:siperian.api',null,'0','1','true'};            
        private String[] apex_schema_type_info = new String[]{'urn:siperian.api','true','false'};            
        private String[] field_order_type_info = new String[]{'username','Password','orsId','siperianObjectUid','recordKey','recordTypes'};
    }
    
    public class GetResponse{
        
        public String message;
        public MDM_SiperianService.RecordKey recordKey;
        public MDM_SiperianService.Record[] record;
        public Boolean lockedByInteractionId;                        
        private String[] message_type_info = new String[]{'message','urn:siperian.api',null,'0','1','false'};
        private String[] recordKey_type_info = new String[]{'recordKey','urn:siperian.api',null,'1','1','false'};
        private String[] record_type_info = new String[]{'record','urn:siperian.api',null,'0','-1','false'};            
        private String[] lockedByInteractionId_type_info = new String[]{'lockedByInteractionId','urn:siperian.api',null,'0','1','true'};            
        private String[] apex_schema_type_info = new String[]{'urn:siperian.api','false','false'};           
        private String[] field_order_type_info = new String[]{'message','recordKey','record','lockedByInteractionId'};
    }

    public class Soap{                
        
        public String endpoint_x = 'callout:SiperianService';
        public Map<String,String> inputHttpHeaders_x, outputHttpHeaders_x;        
        public String clientCertName_x, clientCert_x, clientCertPasswd_x;        
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'urn:metadata.siperian.api', 'metadataSiperianApi', 'urn:siperian.api', 'MDM_SiperianService', 'urn:types.siperian.api', 'typesSiperianApi'};        
        
        /**************************************************************************************
        Purpose:     For first callout (searchQuery Call) to get the golden records
        Parameters:  Filter Creteria, Records to return and Return total no of records
        Return:      type of MDM_SearchQueryWrapper 
        ***************************************************************************************/
        public MDM_SearchQueryWrapper searchQuery(String filterCriteria, Integer recordsToReturn, Boolean returnTotal){            
            MDM_SiperianService.SearchQueryRequest request_x = new MDM_SiperianService.SearchQueryRequest();
            request_x.filterCriteria = filterCriteria;
            request_x.recordsToReturn = recordsToReturn;
            request_x.returnTotal = returnTotal;            
            MDM_SiperianService.SearchQueryResponse response_x;
            Map<String, MDM_SiperianService.SearchQueryResponse> response_map_x = new Map<String, MDM_SiperianService.SearchQueryResponse>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'urn:siperian.api',
              'searchQuery',
              'urn:siperian.api',
              'searchQueryReturn',
              'MDM_SiperianService.SearchQueryResponse'}
            );
            response_x = response_map_x.get('response_x');
            String resp = JSON.serialize(response_x);
            MDM_SearchQueryWrapper result;
            if(Test.isRunningTest()){                   
                String respTest = MDM_SiperianService_MockResponse.responseForMethod_searchQuery();
                result = generateJSONContent(respTest);
            }else{            
                result = generateJSONContent(resp);
            }
            return result;
        }
        
        /**************************************************************************************
        Purpose:     For second callout (get Call) to get the xref records
        Parameters:  RecordKey & RecordTypes
        Return:      type of MDM_GetResponseWrapper 
        ***************************************************************************************/
        public MDM_GetResponseWrapper get(MDM_SiperianService.RecordKey recordKey, MDM_SiperianService.RecordTypes recordTypes) {
            MDM_SiperianService.GetRequest request_x = new MDM_SiperianService.GetRequest();
            request_x.recordKey = recordKey;            
            request_x.recordTypes = recordTypes;            
            MDM_SiperianService.GetResponse response_x;
            Map<String, MDM_SiperianService.GetResponse> response_map_x = new Map<String, MDM_SiperianService.GetResponse>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'urn:siperian.api',
              'get',
              'urn:siperian.api',
              'getReturn',
              'MDM_SiperianService.GetResponse'}
            );
            response_x = response_map_x.get('response_x');
            String resp = JSON.serialize(response_x);               
            //MDM_GetResponseWrapper result = generateJSONgetContent(resp);
            MDM_GetResponseWrapper result;
            if(Test.isRunningTest()){
                String respTest = MDM_SiperianService_MockResponse.responseForMethod_get();
                result = generateJSONgetContent(respTest);
            }
            else{
                result = generateJSONgetContent(resp);
            }
            return result;                       
        }
        
        /**************************************************************************************
        Purpose:     To generate searchquery wrapper response
        Parameters:  response in string
        Return:      type of MDM_SearchQueryWrapper 
        ***************************************************************************************/
        public MDM_SearchQueryWrapper generateJSONContent(String res){
            MDM_SearchQueryWrapper finalRes;
            if(!String.isEmpty(res)){ 
                finalRes = (MDM_SearchQueryWrapper) JSON.deserialize(res, MDM_SearchQueryWrapper.class);
            }
            return finalRes;
        }
        
        /**************************************************************************************
        Purpose:     To generate get call wrapper response
        Parameters:  response in string
        Return:      type of MDM_GetResponseWrapper 
        ***************************************************************************************/
        public MDM_GetResponseWrapper generateJSONgetContent(String res){       
            MDM_GetResponseWrapper finalRes;  
            if(!String.isEmpty(res)){
                finalRes = (MDM_GetResponseWrapper) JSON.deserialize(res, MDM_GetResponseWrapper.class);                
            }   
            return  finalRes;
        }
    }   
}