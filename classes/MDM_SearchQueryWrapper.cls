/*******************************************************//**
@class      searchQueryWrapper
@purpose    Wrapper class to parse MDM response into a single unit. Extends baseWrapper to get
            values based on datatypes.
@author     Deepak Dwivedi 
@date       8/9/2018 3:18 AM
@invokedby  MDM_SiperianService, MDM_AcountsHelper
***********************************************************/

public with sharing class MDM_SearchQueryWrapper extends MDM_BaseWrapper{
    
    public String message;
    public String recordCount;
    public String searchToken;
    public String interactionId;
    public String filterParameter;     
    public List<MDM_SearchQueryRecordWrapper> record {get; set;}
    
    public MDM_SearchQueryWrapper(){        
    }
	/********************************
    Purpose:     to set the field value
    Parameters:  field and value of object type
    Return:      void
    ********************************/
    public override void setField(String field, Object value){
        switch on field.toLowerCase(){
            when 'message' { this.message = getStringValue(value);}
            when 'recordCount' { this.recordCount = getStringValue(value); }
            when 'searchToken' { this.searchToken = getStringValue(value); }
            when 'interactionId' { this.interactionId = getStringValue(value); }
            when 'filterParameter' { this.filterParameter = getStringValue(value); }
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
            when 'recordCount' { return this.recordCount;}
            when 'searchToken' { return this.searchToken;}
            when 'interactionId' { return this.interactionId;}
            when 'filterParameter' { return this.filterParameter;}
            when else { return null;}
        }
    }

    /********************************
    Purpose:     to deep clone the nested response
    Parameters:  none
    Return:      void
    ********************************/
    public override Object deepClone(){
        MDM_SearchQueryWrapper result = this.clone();        
        if(this.record != null) {
            result.record = new List<MDM_SearchQueryRecordWrapper>();
            for(MDM_SearchQueryRecordWrapper r : this.record){
                result.record.add((MDM_SearchQueryRecordWrapper)r.deepClone());
            }
        }
        return result;
    }
}