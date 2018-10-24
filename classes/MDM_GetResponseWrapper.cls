/*******************************************************//**
@class      MDM_GetResponseWrapper
@brief      Wrapper class to parse MDM response into a single unit. Extends baseWrapper to get
            values based on datatypes.
@author     Deepak Dwivedi 
@bug        No known defects.
@todo       None.
***********************************************************/

public with sharing class MDM_GetResponseWrapper extends MDM_BaseWrapper{
    
    public String message;
    public List<MDM_GetRecordWrapper> record {get; set;}
    
    public MDM_GetResponseWrapper(){        
    }

    public override void setField(String field, Object value){
        switch on field.toLowerCase(){
            when 'message' { this.message = getStringValue(value);}            
        }
    }

    public override Object getField(String field){
        switch on field.toLowerCase(){
            when 'message' { return this.message;}            
            when else { return null;}
        }
    }

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