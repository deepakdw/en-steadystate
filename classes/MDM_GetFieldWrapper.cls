/*******************************************************//**
@class      MDM_GetFieldWrapper
@brief      Inner wrapper class of MDM_GetRecordWrapper to parse MDM get call response into a single unit, holds
            nested fields under list of MDM_GetRecordWrapper. Extends baseWrapper to get values based on datatypes.
@author     Deepak Dwivedi 
@Date       8/20/2018 12:02 AM
@invokedby  MDM_AccountsHelper, MDM_SiperianService
***********************************************************/

public with sharing class MDM_GetFieldWrapper extends MDM_BaseWrapper{
    
    public String name;
    public String stringValue;
    public String dateValue;
    public String bigIntegerValue;
    public String bigDecimalValue;
    
    public MDM_GetFieldWrapper(){        
    }
    
    /****************************************
    Purpose:     set field value
    Parameters:  field and value in object
    Return:      void
    ****************************************/
    public override void setField(String field, Object value){
        switch on field.toLowerCase(){
            when 'name' { this.name = getStringValue(value);}
            when 'stringValue' { this.stringValue = getStringValue(value); }
            when 'dateValue' { this.dateValue = getStringValue(value); }  
            when 'bigIntegerValue' { this.bigIntegerValue = getStringValue(value); }
            when 'bigDecimalValue' { this.bigDecimalValue = getStringValue(value); }
        }
    }
    
    /****************************************
    Purpose:     get field value
    Parameters:  field in string
    Return:      void
    ****************************************/
    public override Object getField(String field){
        switch on field.toLowerCase(){
            when 'name' { return this.name;}
            when 'stringValue' { return this.stringValue;}
            when 'dateValue' { return this.dateValue;}  
            when 'bigIntegerValue' { return this.bigIntegerValue; }
            when 'bigDecimalValue' { return this.bigDecimalValue; }
            when else { return null;}
        }
    }
    
    /****************************************
    Purpose:     deep clone the nested response
    Parameters:  none
    Return:      void
    ****************************************/
    public override Object deepClone(){             
        MDM_GetFieldWrapper result = this.clone();        
        return result;
    }
}