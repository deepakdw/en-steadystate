/*******************************************************//**
@class      MDM_GetResponseWrapper
@purpose    Wrapper class to parse MDM response into a single unit. Extends baseWrapper to get
            values based on datatypes.
@author     Deepak Dwivedi 
@date       8/20/2018 7:20 AM
@invokedby  MDM_SiperianService, MDM_AccountsHelper.
***********************************************************/

public with sharing class MDM_GetResponseWrapper extends MDM_BaseWrapper{
    
    public String message;
    public List<MDM_GetRecordWrapper> record {get; set;}
    
    public MDM_GetResponseWrapper(){        
    }
    
	/********************************
    Purpose:     to set the field value
    Parameters:  field and value of object type
    Return:      void
    ********************************/
    public override void setField(String field, Object value){
        switch on field.toLowerCase(){
            when 'message' { this.message = getStringValue(value);}            
        }
    }
    
	/********************************
    Purpose:     to get the field
    Parameters:  field of string type
    Return:      void
    ********************************/
    public override Object getField(String field){
        switch on field.toLowerCase(){
            when 'message' { return this.message;}            
            when else { return null;}
        }
    }
    
	/********************************
    Purpose:     to deep clone the nested response
    Parameters:  none
    Return:      void
    ********************************/
    public override Object deepClone(){
        MDM_GetResponseWrapper result = this.clone();        
        if(this.record != null) {
            result.record = new List<MDM_GetRecordWrapper>();
            for(MDM_GetRecordWrapper r : this.record){
                result.record.add((MDM_GetRecordWrapper)r.deepClone());
            }
        }
        return result;
    }
}